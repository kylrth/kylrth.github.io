---
title: "avatarify"
date: 2021-11-24T11:58:34-05:00
draft: false
tags: ["self-hosted", "deep-learning"]
---

[Avatarify](https://github.com/alievk/avatarify-python) is a cool project that lets you create a relatively realistic avatar that you can use during video meetings. It works by creating a fake video input device and passing your video input through a neural network in PyTorch. My laptop doesn't have a GPU, so I used the server/client setup.

## setting up the server

Be sure you've installed the Nvidia Docker runtime so that the Docker container can use the GPU. You can see how I did that [here]({{< relref "jupyter-lab" >}}). Run the following on the server:

```sh
mkdir avatarify
cd avatarify
git clone https://github.com/alievk/avatarify-python.git repo
vim docker-compose.yml
```

Add the following to `docker-compose.yml`:

```yaml
version: "3.9"

services:
  avatarify:
    build:
      context: ./repo
    image: avatarify
    restart: unless-stopped
    runtime: nvidia
    ports:
      - "5557:5557"  # you may want to specify a bind address here to not expose
      - "5558:5558"  # the service to others
```

Now run `docker-compose build avatarify` to build the image, and you should be able to start the service with `docker-compose up -d`.

## setting up the client

The client takes more work because you need to install a kernel module that allows the creation of this faked video camera. I'm using Manjaro, currently running kernel 5.15.2-2. It's important to know the exact kernel version---`5.15.2-2`---otherwise the module won't load correctly. You can find the kernel version by running `uname -r`. Now download the kernel headers for your version. For me, this meant opening the package manager, searching "linux headers", and installing the one with the correct version. You'll need to restart after that.

Now you should be able to install the v4l2loopback module sources. In the Manjaro official repositories there's a package called `v4l2loopback-dkms`, which does this for me. Otherwise, there are instructions for installation with DKMS [here](https://github.com/umlaeute/v4l2loopback#DKMS). Another restart and the module should be installed.

Now that we've installed v4l2loopback, we can run the client in Docker so that no other dependencies (Conda, PyTorch, etc.) are installed on the host. Unfortunately, avatarify only has a single image which will contain the PyTorch model and CUDA dependencies even though we don't need them on the client. We've got to build the image again on the client this time:

```sh
git clone https://github.com/alievk/avatarify-python.git
cd avatarify
docker build -t avatarify .
```

Now you can run the client with the following command (executed in the avatarify repo directory):

```sh
./run.sh --is-client --no-gpus --docker --in-addr tcp://<server-ip>:5557 --out-addr tcp://<server-ip>:5558
```

Now follow the instructions in the avatarify repo's [readme](https://github.com/alievk/avatarify-python/tree/master/docs#controls) for using the avatar!
