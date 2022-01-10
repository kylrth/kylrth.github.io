---
title: "Minecraft in Docker"
date: 2021-08-02T13:25:28-06:00
draft: false
tags: ["self-hosted", "minecraft"]
---

This guide shows how to host multiple Minecraft servers on a single machine with docker-compose.

```sh
mkdir minecraft_server
cd minecraft_server
mkdir data/
wget {{< resource-ref "docker-compose.yml" >}} \
    -O docker-compose.yml
```

This docker-compose setup uses itzg's Docker image, which you see further documentation for [here](https://github.com/itzg/docker-minecraft-server).

If you're moving from a vanilla Minecraft world, do the following to get the different world directories in the right position:

```sh
cp -r ${OLD}/world data/server/world
mkdir data/server/world_{nether,the_end}
mv data/server/world/DIM-1 data/server/world_nether/DIM-1
mv data/server/world/DIM1 data/server/world_the_end/DIM1
```

Here's the map from vanilla Minecraft directories to Spigot directories:

- `world/ -> world/`
- `world/DIM-1 -> world_nether/DIM-1`
- `/world/DIM1 -> world_the_end/DIM1`

At this point go ahead and start it with `docker-compose up`. When it first starts, it downloads the Minecraft implementation we specified with the `TYPE` environment variable (in my case [Paper](https://papermc.io/)).

If you want the server to run as a Systemd service, follow the instructions for enabling a docker-compose Systemd service [here](https://kylrth.com/post/matrix-setup/#enabling-the-services-with-systemd).

## exposing two Minecraft servers on the same machine

In order to have two servers running, they'll need to be listening on different ports. It'd be nice for users to not need to remember port numbers, but since Minecraft uses its own protocol over TCP a reverse proxy won't help us. What we can do is create DNS A records for two subdomains that both point to the machine, and then these SRV records:

- `_minecraft` `_tcp.minecraft1` `0` `5` `25566` `minecraft1.kylrth.com`
- `_minecraft` `_tcp.minecraft2` `0` `5` `25567` `minecraft2.kylrth.com`

Once I'd done this, I had to wait like 30 minutes to start seeing the servers show up within the Minecraft client.

## administration

Administration can be done with RCON by exec-ing into the container:

```bash
$ docker-compose exec minecraft rcon-cli
> whitelist add kylrth  # add yourself to whitelist
Added kylrth to the whitelist
> op kylrth  # make yourself op
> help  # see other administration options here
...
```
