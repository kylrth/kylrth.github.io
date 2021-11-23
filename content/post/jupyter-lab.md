---
title: "Jupyter Lab Hub in Docker with Nvidia GPU support"
date: 2021-10-19T20:28:25-04:00
draft: false
tags: ["self-hosted", "machine-learning", "programming"]
---

This is how I set up my headless home server with a Jupyter Lab Docker container with an Nvidia GPU runtime.

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

Now, clone my repo:

```sh
git clone https://github.com/kylrth/GPU-Jupyterhub.git
```

This repo has Dockerfiles for building custom CUDA-enabled Jupyter images. The main [Dockerfile](https://github.com/kylrth/GPU-Jupyterhub/blob/master/Dockerfile) builds the Jupyter Hub image, and there are [two](https://github.com/kylrth/GPU-Jupyterhub/blob/master/notebook-images/base-notebook/Dockerfile) [Dockerfiles](https://github.com/kylrth/GPU-Jupyterhub/blob/master/notebook-images/dl-notebook/Dockerfile) used to build a CUDA-enabled Jupyter Notebook (and Lab) image. (The notebook containers run Jupyter Lab [too](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#docker-options).) The first Dockerfile builds a base image with Jupyter Lab installed, and the second adds deep learning packages like scikit-learn and PyTorch. If you're using a different version of CUDA than I am, update the `FROM` directive as necessary. Add the packages you need before continuing.

After modifying the notebook image builds to your taste, open the main Dockerfile. Since we're using PAM authentication for now, you actually need to manually build your usernames and passwords into the image. Edit the last few lines of this Dockerfile to refer to your own username (instead of `kyle`), and add passwords. When I get some time I'd like to switch my setup back to GitHub auth to avoid this cumbersome (and insecure) method.

Once you've updated the Dockerfiles, you will be able to build the images by calling `make`.

Now take a look at the sample [`docker-compose.yml`](https://github.com/kylrth/GPU-Jupyterhub/blob/master/docker-compose.yml). You'll notice that it mounts `./data/configs/` to the Hub container. Check out that directory yourself, and you'll find `jupyterhub_config.py` and `userlist`. Edit `userlist` to reflect the users you previously added to the Dockerfile, marking the admin users as desired. Now edit `jupyterhub_config.py`. You need to create a token for `c.ConfigurableHTTPProxy.auth_token`, and update the paths in `c.DockerSpawner.volumes` to point to the paths on the host computer where the user data and shared data will be stored. Finally, add the users you just added to the `userlist` to `c.Authenticator.allowed_users` and `c.Authenticator.admin_users`.

Now run `docker-compose up` and you should be up and running! To test your installation, run the following in a Jupyter notebook:

```python
import torch
print(torch.rand(2, 3).cuda())
```

If you get a matrix printed back with no errors, you're good to go!

Here are some **known issues**:

- PAM authentication is kind of annoying here, so when I get time I'd like to switch to GitHub auth like in [this tutorial](https://github.com/jupyterhub/jupyterhub-deploy-docker).
- For now, to use Jupyter Lab instead of Jupyter Notebook you have to change the URL from `.../tree` to `.../lab` manually. I haven't figured out how to make this the default yet.
- When a new user is added, you'll need to manually `mkdir /path/on/HOST/to/user_data/{username}`, otherwise Docker will do it for you as root and the user won't be able to use the directory.
