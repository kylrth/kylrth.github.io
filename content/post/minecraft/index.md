---
title: "Minecraft in Docker with SpigotMC"
date: 2021-08-02T13:25:28-06:00
draft: false
tags: ["self-hosted", "minecraft"]
---

SpigotMC is a reimplementation of Minecraft with some optimizations and the ability to run mods. I choose to use it because there's a Docker image that makes it easy to host. This guide shows how to host multiple Minecraft servers on a single machine.

```sh
mkdir minecraft_server
cd minecraft_server
mkdir data/{server,spigot}
wget {{< resource-ref "docker-compose.yml" >}} \
    -O docker-compose.yml
```

If you're moving from a Spigot world, just copy the `world/` directory to `data/server/world`. If you're moving from a vanilla Minecraft world, do the following to get the different world directories in the right position:

```sh
cp -r ${OLD}/world data/server/world
mkdir data/server/world_nether data/server/world_the_end
mv data/server/world/DIM-1 data/server/world_nether/DIM-1
mv data/server/world/DIM1 data/server/world_the_end/DIM1
```

Here's the map from vanilla Minecraft directories to Spigot directories:

- `world/ -> world/`
- `world/DIM-1 -> world_nether/DIM-1`
- `/world/DIM1 -> world_the_end/DIM1`

At this point go ahead and start it with `docker-compose up`. When it first starts, it looks for a build of SpigotMC for the Minecraft version you specified in the docker-compose config. If it's not there, it will build it. When it finishes building, your server is ready to go!

If you want the server to run as a Systemd service, follow the instructions for enabling a docker-compose Systemd service [here](https://kylrth.com/post/matrix-setup/#enabling-the-services-with-systemd).

## exposing two Minecraft servers on the same machine

In order to have two servers running, they'll need to be listening on different ports. It'd be nice for users to not need to remember port numbers, but since Minecraft uses its own protocol over TCP a reverse proxy won't help us. What we can do is create DNS A records for two subdomains that both point to the machine, and then these SRV records:

- `_minecraft` `_tcp.minecraft1` `0` `5` `25566` `minecraft1.kylrth.com`
- `_minecraft` `_tcp.minecraft2` `0` `5` `25567` `minecraft2.kylrth.com`

Once I'd done this, I had to wait like 30 minutes to start seeing the servers show up within the Minecraft client.
