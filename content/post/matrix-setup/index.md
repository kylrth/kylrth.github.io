---
title: "Matrix setup with Synapse, Postgres, Maubot, and matrix-registration"
date: 2021-08-02T10:30:00-06:00
draft: false
tags: ["self-hosted", "matrix"]
---

This is how I set up my own [Matrix](https://matrix.org) server with Docker.{{% sidenote %}}These instructions were originally for ARM, back when I ran this server on a Raspberry Pi. Unfortunately, the Matrix community stopped releasing ARM images, so the latest version that will work on ARM without QEMU is v1.26.0, which is very old now. These instructions have been updated to use `amd64` images, but I'll preserve the references to ARM images as comments. If you're going to work from a Pi, be sure to switch it to run in 64-bit mode for optimal performance: `echo 'arm_64bit=1' | sudo tee -a /boot/config.txt && sudo systemctl reboot`.{{% /sidenote %}} There is an [Ansible playbook](https://github.com/spantaleev/matrix-docker-ansible-deploy) that's quite popular, but I host a lot of other services with Docker on the same server and I wanted to continue managing all of them together, just with `docker-compose`.

This installation comes with [Maubot](https://github.com/maubot/maubot) and [matrix-registration](https://github.com/ZerataX/matrix-registration) containers too. If you don't want to use those features, leave out those sections of the docker-compose config and don't follow the instructions in the corresponding sections.

First create a directory for the services we're going to provide:

```sh
mkdir -p ~/services/data/{certbot,maubot,nginx,postgres,registration,synapse}
cd ~/services
```

The rest of the commands below will assume the working directory is `~/services`.

## federation

The homeserver is going to be hosted on matrix.kylrth.com, but the server name is kylrth.com. (That way usernames can be `@kyle:kylrth.com` instead of `@kyle:matrix.kylrth.com`, which would be sort of like having an email address `kyle@email.kylrth.com`.) For federation to work correctly, other servers need to know that kylrth.com uses matrix.kylrth.com as its server. To do that, create the file `kylrth.com/.well_known/matrix/server` with the contents `{ "m.server": "matrix.kylrth.com:443" }`. We should also add the following line to `/etc/hosts` so that any outgoing requests to matrix.kylrth.com are routed right back to the machine:

```text
127.0.0.1 matrix.kylrth.com
```

Another note: you may want to change the DNS server to something better. I added the following line to `/etc/dhcpcd.conf`:

```text
static domain_name_servers=1.1.1.1 1.0.0.1 8.8.4.4 8.8.8.8
```

And then do `sudo service dhcpcd restart`.

## docker-compose

Now install `docker` and `docker-compose` following the instructions [here](https://devdojo.com/bobbyiliev/how-to-install-docker-and-docker-compose-on-raspberry-pi). Then create `docker-compose.yml`:

```sh
wget {{< resource-ref "docker-compose.yml" >}} \
    -O docker-compose.yml
```

You'll note that in several places I set the user to `1000:1000`. I did this so that data files are owned by my user, plus it's generally safer not to run containers as root. You can see which numbers you need to use by running `id -u` and `id -g`.

## SSL certificate

We're going to set up certbot with a new SSL certificate from LetsEncrypt. Since I host other things on this server besides matrix.kylrth.com, I do a wildcard certificate (`*.kylrth.com`), which requires DNS verification by creating a TXT record in the DNS settings for my domain.{{% sidenote %}}You can use `host -t txt _acme-challenge.kylrth.com` to make sure the TXT records have been updated before having LetsEncrypt check them.{{% /sidenote %}}

```sh
mkdir -p data/certbot/conf
curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem \
    > data/certbot/conf/ssl-dhparams.pem
curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf \
    > data/certbot/conf/options-ssl-nginx.conf
docker-compose run --rm certbot certonly --manual --preferred-challenges=dns \
    -w /var/www/certbot --email name@example.com -d '*.kylrth.com' \
    --rsa-key-size 4096 --agree-tos --force-renewal
```

If you don't need a wildcard certificate, replace that last line with this:

```sh
docker-compose run --rm certbot certonly --webroot \
    -w /var/www/certbot --email name@example.com -d 'matrix.kylrth.com' \
    --rsa-key-size 4096 --agree-tos --force-renewal
```

To renew the wildcard certificate, you'll have to run that last `docker-compose run certbot` line again. I'd suggest creating a `scripts/` directory for things like this:

```sh
mkdir -p scripts
wget {{< resource-ref "scripts/update_cert.sh" >}} \
    -O scripts/update_cert.sh
chmod +x scripts/update_cert.sh
```

If you want to set the certbot container to renew a **non-wildcard** certificate,  remove the `profiles` section from the certbot container in the docker-compose.yml so that the container runs with the rest of the services, and add the following instead:

```yaml
entrypoint: "/bin/sh -c 'trap exit TERM; while :; do certbot renew; sleep 12h & wait $${!}; done;'"
```

Note that changing the entrypoint this way will break the previous `docker-compose run` command that you ran to get the certificate if you were to run it again.

## NGINX

To set up NGINX, download the `app.conf` I've got [here]({{< resource-ref "docker-compose.yml" >}}) (and modify it to your liking):

```sh
wget {{< resource-ref "app.conf" >}} \
    -O data/nginx/app.conf
```

## Synapse

Before doing anything else, make sure you have the version you want in the docker-compose config for the Synapse container.{{% sidenote %}}The last version to support ARM was v1.26.0, so if you're on ARM you'll need to use that.{{% /sidenote %}} Update the docker-compose config to use whatever version is latest.{{% sidenote %}}In general it's not a good idea to use the default `latest` tag for remote images, because version upgrades often require config updates. Always check the upgrade instructions for Synapse [here](https://matrix-org.github.io/synapse/develop/upgrade).{{% /sidenote %}}

Now generate the initial configuration for Synapse:

```sh
docker-compose run --rm \
    -e SYNAPSE_SERVER_NAME=kylrth.com -e SYNAPSE_REPORT_STATS=no \
    synapse generate
```

Now edit `data/synapse/homeserver.yaml` to your liking. Here are some things I did:

- change `max_upload_size` to `"100M"` or something
- enable URL previews

Run `docker-compose run -v /etc/passwd:/etc/passwd:ro postgres` to give Postgres the chance to initialize the database before Synapse looks for it.

The next thing you should do is create the first user for yourself, and make that user an admin on the server. Run `docker-compose up synapse` to start the container temporarily, then open another terminal and run `docker-compose exec synapse register_new_matrix_user -c /data/homeserver.yaml http://localhost:8008`. Don't forget to make yourself an admin! Once you finish with that command, quit the `up` process with Ctrl+C, and then run `docker-compose down` to destroy all the containers.

## Maubot

Generate a config file by running `docker-compose run --rm maubot` and then update the config to your liking, making sure to update the following objects:

```yaml
server:
  public_url: https://matrix.kylrth.com
registration_secrets:
  kylrth.com:
    url: https://matrix.kylrth.com
    secret: <registration secret from data/synapse/homeserver.yaml>
admins:
  root: ''  # disable login
  <username>: <password>  # password will be replaced with bcrypted hash on startup
```

## matrix-registration

Copy the sample config from the repo:

```sh
wget https://raw.githubusercontent.com/ZerataX/matrix-registration/master/config.sample.yaml \
    -O data/registration/config.yaml
```

Update the config to your liking, making sure to update the following elements:

```yaml
server_location: 'http://synapse'
server_name: 'kylrth.com'
registration_shared_secret: <registration secret from data/synapse/homeserver.yaml>
admin_api_shared_secret: <invent a secret string here>
base_url: ''
db: 'sqlite:////data/db.sqlite3'
host: '0.0.0.0'  # super important for running in Docker
logging:
  handlers:
    file:
      filename: /data/m_reg.log
```

I've got a script that can be used to create a one-time-use token that expires after 7 days:

```sh
mkdir -p scripts
wget {{< resource-ref "scripts/new_matrix_token.sh" >}} \
    -O scripts/new_matrix_token.sh
chmod +x scripts/new_matrix_token.sh
```

Read about your options for managing tokens [here](https://github.com/ZerataX/matrix-registration/wiki/api#creating-a-new-token).

## enabling the services with Systemd

See [this section]({{< relref "self-hosting#systemd-and-docker" >}}) of my self-hosting post to learn how to use Systemd to make this set of containers a background service that starts at boot. Now we're finally ready to get everything started.

```sh
sudo systemctl start services
```

Message me [@kyle:kylrth.com](https://matrix.to/#/@kyle:kylrth.com) and tell me how it went!
