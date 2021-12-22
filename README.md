# Docker & Portainer on ProxMox

<p align="center">
    <img height="200" alt="Plex Logo" src="img/logo_docker.png">
    <img height="200" alt="Portainer Logo" src="img/logo_portainer.png">
    <img height="200" alt="ProxMox Logo" src="img/logo_proxmox.png">
</p>

Create a [ProxMox](https://www.proxmox.com/en/) LXC container running Ubuntu and install [Docker](https://www.docker.com/) and [Portainer](https://www.portainer.io/).

Tested on ProxMox v7, Docker 20.10 & Portainer 2

## Usage

SSH to your ProxMox server as a privileged user and run...

```shell
bash -c "$(wget --no-cache -qLO - https://raw.githubusercontent.com/noofny/proxmox_docker/master/setup.sh)"
```

## Inspiration

- [Install Docker & Portainer 2.0 on Debian Based Distros!](https://getmethegeek.com/blog/2020-04-20-installing-docker-and-portainer-on-proxmox/)
