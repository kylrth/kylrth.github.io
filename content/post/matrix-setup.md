---
title: "Matrix setup with Synapse, Postgres, and matrix-registration"
date: 2021-05-31T21:35:34-06:00
draft: false
tags: ["matrix"]
---

This is how I set up my own [Matrix](https://matrix.org) server. First, switch the Raspberry Pi to 64-bit mode:

```bash
sudoedit /boot/config.txt  # add `arm_64bit=1` to the end of the file
sudo systemctl reboot
```

Create a directory for Matrix stuff:

```bash
mkdir -p ~/matrix/data/synapse
cd ~/matrix
mkdir data/postgres
```

It's hosted on matrix.kylrth.com but the server name is kylrth.com. For federation to work correctly, other servers need to know that kylrth.com uses matrix.kylrth.com as its server. To do that, create the file `kylrth.com/.well_known/matrix/server` with the contents. `{ "m.server": "matrix.kylrth.com:443" }`. We should also add the following line to `/etc/hosts` so that the router doesn't get in the way of requests sent from one container to another:

```text
127.0.0.1 matrix.kylrth.com
```

Generate the initial configuration for Synapse:

```bash
docker-compose run --rm -e UID=$(id -u) -e GID=$(id -g) -e SYNAPSE_SERVER_NAME=kylrth.com -e SYNAPSE_REPORT_STATS=no synapse generate
```

Now edit `data/synapse/homeserver.yaml` to have the right configuration. Some things to note:

- change `max_upload_size` to `"50M"` or something
- I enabled URL previews

The `docker-compose.yml` I used is based on the one [here](https://jonnev.se/matrix-homeserver-with-docker/), but I set the `UID` and `GID` environment variables for Synapse, removed the network, and switched to the `arm32v7/postgres` and `black0/synapse` images since I'm on armv7. Here you go:

```yaml
version: "2"
services:
  postgres:
    image: arm32v7/postgres:12.5
    user: 1001:1001
    restart: always
    ports:  # Adding 127.0.0.1 ensures the port isn't exposed ON the host
      - "127.0.0.1:5432:5432"
    volumes:
     - ./data/postgres:/var/lib/postgresql/data
    environment:
     - POSTGRES_PASSWORD=Set this to something better
     - POSTGRES_USER=synapse
     - POSTGRES_INITDB_ARGS=--locale C --encoding UTF8

  synapse:
    image: matrixdotorg/synapse:v1.26.0  # this is the latest on armv7, but if you're x86_64 do a later tag
    restart: always
    depends_on:
     - postgres
    ports:
     - "8008:8008"  # client-server
     - "8448:8448"  # federation
    volumes:
     - ./data/synapse:/data
    environment:
     - UID=1001
     - GID=1001

  registration:
    image: matrix-registration
    restart: always
    depends_on:
     - synapse
    ports:
     - "5000:5000"
    volumes:
     - ./data/registration:/data

  maubot:
    image: kylrth/maubot:latest
    restart: always
    ports:
     - "29316:29316"
    volumes:
     - ./data/maubot:/data:z
    environment:
     - UID=1001
     - GID=1001
```

You'll want to `docker-compose run -v /etc/passwd:/etc/passwd:ro postgres` to give Postgres the chance to initialize the database before Synapse looks for it.

Use the example docker-compose service to make this a background service.

Now set up NGINX:

```yaml
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    # federation (server-server)
    listen 8448 ssl http2 default_server;
    listen [::]:8448 ssl http2 default_server;

    server_name matrix.kylrth.com;
    server_tokens off;

    ssl_certificate /etc/letsencrypt/live/kylrth.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/kylrth.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    location / {
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $host;
        client_max_body_size 100M;
    }
    location /_matrix/maubot {
        proxy_pass http://localhost:29316;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
    location /_download {
        root /etc/www;
    }
}
```

Once you've started the service, connect to the container with `docker exec -it <container-id> /bin/sh` and run

```sh
register_new_matrix_user -c /data/homeserver.yaml http://localhost:8008
```

Be sure to make yourself an admin!

Be *a bajillion percent* sure that you set `host: '0.0.0.0'` in the config for the `registration` container, otherwise it won't listen to incoming traffic from outside. Once it's running, use `docker-compose exec registration python -m matrix_registration gen` to create a token so other users can join.

Another note: you may want to change the DNS server to something better. I added the following line to `/etc/dhcpcd.conf`:

```text
static domain_name_servers=1.1.1.1 1.0.0.1 8.8.4.4 8.8.8.8
```

And then do `sudo service dhcpcd restart`.
