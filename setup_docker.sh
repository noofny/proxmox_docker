#!/bin/bash


# locale
echo "Setting locale..."
LOCALE_VALUE="en_AU.UTF-8"
echo ">>> locale-gen..."
locale-gen ${LOCALE_VALUE}
cat /etc/default/locale
source /etc/default/locale
echo ">>> update-locale..."
update-locale ${LOCALE_VALUE}
echo ">>> hack /etc/ssh/ssh_config..."
sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config


echo "Installing dependencies..."
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common


echo "Installing Docker..."
curl -fsSL download.docker.com/linux/debian/gpg | \
    apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose
systemct1 enable docker


echo "Installing Portainer..."
mkdir /media/portainer
docker run \
    -d \
    -p 8000:8000 -p 9000:9000 \
    --name=portainer \
    --restart=always \
    --pull=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /mnt/portainer:/data portainer/portainer-ce 


echo "Setup complete - you can access the console at http://$(hostname -I):9000/#!/home"
