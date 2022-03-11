---
title: "hosting a Tor onion service"
date: 2022-02-24T18:28:49-05:00
draft: false
tags: ["security", "tor"]
thumbnail: "onion.png"
---

[Tor onions](https://community.torproject.org/onion-services/overview/) are a way to host secure services that protect the anonymity of you *and* your clients. It also removes load from Tor exit nodes. If you open this page in the Tor browser it will redirect you to the following address:

```txt
http://kylrthjj7mpvktolz7u6fnudt3hpdvjw4hzquanjpepgsf5vcq5divad.onion{{< rel-ref >}}
```

which can only be opened from inside the Tor network.

## getting started

To host an onion service, we'll have a Docker container running Tor that decodes requests and forwards them to another container hosting the service. I've got a GitHub repo that will help you build the Tor image and shows you an example `docker-compose.yml`:

```sh
git clone https://github.com/kylrth/tor-onion-docker.git
cd tor-onion-docker
docker-compose build
```

Take a look at the [`docker-compose.yml`](https://github.com/kylrth/tor-onion-docker/blob/main/docker-compose.yml) to see an example with NGINX as the backend service.

## generating an onion address with a prefix

These onion addresses are long because they're cryptographically generated public keys that verify that you are indeed the host of the address. This means that onion services come with the security benefits of HTTPS out of the box, but it also means the addresses are ugly. We can increase memorability by brute-forcing a vanity prefix:

```sh
PREFIX=kylrth
git clone https://github.com/cathugger/mkp224o.git
pushd mkp224o
docker build -f contrib/docker/Dockerfile -t mkp224o .
mkdir output
docker run -it --rm -u 1000:1000 -v $(pwd)/output:/stuff mkp224o ${PREFIX} -v -n 1 -d /stuff
popd
mv mkp224o/output/${PREFIX}* data/onionserver/
```

The prefix can't be much longer than 6 characters without the expected runtime becoming infeasible.

## onion location

If you'd like users of your website to know about the onion version, add a `<meta>` tag to your documents:

```html
<meta http-equiv="onion-location"
    content="http://kylrthjj7mpvktolz7u6fnudt3hpdvjw4hzquanjpepgsf5vcq5divad.onion" />
```

Since I use Hugo to build my site, I can direct users to the onion version of the specific page they requested:

```html
<meta http-equiv="onion-location"
    content="http://kylrthjj7mpvktolz7u6fnudt3hpdvjw4hzquanjpepgsf5vcq5divad.onion{{ .Permalink | relURL }}" />
```

In cases where you have less control of the documents, you can instead add an `Onion-Location` header with a reverse proxy. Here's how you do it with NGINX:

```nginx
add_header Onion-Location http://kylrthjj7mpvktolz7u6fnudt3hpdvjw4hzquanjpepgsf5vcq5divad.onion$request_uri;
```

You can see more details [here](https://community.torproject.org/onion-services/advanced/onion-location/).
