---
title: "Jupyter Lab Hub in Docker with Nvidia GPU support"
date: 2021-10-19T20:28:25-04:00
draft: false
tags: ["self-hosted", "machine-learning", "programming"]
---

This is how I set up my headless home server with a Jupyter Lab Docker container with an Nvidia GPU runtime. Login is handled by a GitHub OAuth application.

## Nvidia drivers and the container runtime

First, check [here](https://docs.nvidia.com/cuda/archive/11.4.2/cuda-toolkit-release-notes/index.html) (replacing the CUDA version in the URL with your own) to see which Nvidia drivers you need for the CUDA toolkit version you want. I'm using CUDA 11.4.2, which means I need at least driver version 470.

```sh
sudo add-apt-repository ppa:graphics-drivers/ppa
# sudo apt purge nvidia-*  # if you have an older driver version installed
sudo apt install nvidia-headless-470 nvidia-utils-470
sudo reboot
```

Now do the following to install the Nvidia container runtime. (I borrowed some of this from Nvidia's container runtime installation instructions [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker).)

```sh
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
docker run --rm --runtime=nvidia all nvidia/cuda:11.4.2-base nvidia-smi  # test
```

## building the images

Now, clone my repo:

```sh
git clone https://github.com/kylrth/GPU-Jupyterhub.git
```

This repo has Dockerfiles for building custom CUDA-enabled Jupyter images. The main [Dockerfile](https://github.com/kylrth/GPU-Jupyterhub/blob/master/Dockerfile) builds the Jupyter Hub image, and there are [two](https://github.com/kylrth/GPU-Jupyterhub/blob/master/notebook/base/Dockerfile) [Dockerfiles](https://github.com/kylrth/GPU-Jupyterhub/blob/master/notebook/dl/Dockerfile) used to build a CUDA-enabled Jupyter Lab image. The first Dockerfile builds a base image with Jupyter Lab installed, and the second adds the packages I want (including PyTorch, TensorFlow, scikit-learn, geopandas, and the Go toolchain). If you're using a different version of CUDA than I am, update the `FROM` directive as necessary. Change the packages to install as you like before continuing.

After modifying the notebook image builds to your taste, open the base Dockerfile and edit the following line to change the deep user's sudo password to something else:

```Dockerfile
RUN echo "deep:changeme" | chpasswd
```

You can also remove that line and the line before it if you don't want users to have sudo access in their containers.

Once you've updated the Dockerfile, you will be able to build the images by calling `make`.

## configuring the Hub service

Make the following changes to `docker-compose.yml`:

- update `POSTGRES_PASSWORD` (in both places it appears) to something secret
- create a new GitHub OAuth application [here](https://github.com/settings/applications/new), setting the authorization callback URL to `https://<domain>/hub/oauth_callback`. Fill the `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` variables in the `docker-compose.yml` with the values from your GitHub OAuth application.

Make the following changes to `jupyterhub_config.py`:

- create a token for `c.ConfigurableHTTPProxy.auth_token`
- update the paths in `c.DockerSpawner.volumes` to point to the paths on the host computer where the user data and shared data will be stored
- update `c.GitHubOAuthenticator.oauth_callback_url` with your domain
- add the permitted GitHub users to `c.Authenticator.allowed_users` and optionally `c.Authenticator.admin_users`

Now run `docker-compose up` and you should be up and running! To test your installation, login and run the following in a Jupyter notebook:

```python
import torch
import tensorflow as tf
print(torch.cuda.is_available())
print(tf.config.list_physical_devices("GPU"))
```

## known issues

When a new user is added, you'll need to manually `mkdir /path/on/HOST/to/user_data/${username}`, otherwise Docker will do it for you as root and the user won't be able to use the directory.
