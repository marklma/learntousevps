#!/bin/bash
wget https://github.com/marklma/newvps/raw/main/sources.list
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv ./sources.list /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y

apt-get install python-pip -y
sudo apt install libsodium-dev m2crypto -y

sudo apt-get install lubuntu-desktop -y
sudo apt-get purge xterm

sudo apt-get install tightvncserver -y
#sudo apt-get install xrdp -y

sudo useradd -m mark

sudo apt-get install language-pack-zh-hans language-pack-zh-hant-base language-pack-zh-hant language-pack-zh-hans -y
sudo apt-get install fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-ukai ttf-wqy-zenhei  zhcon  -y

sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"

pip install shadowsocks
sudo sed -i "s/CIPHER_CTX_cleanup/CIPHER_CTX_reset/g" /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py

sudo apt clean

sudo echo 'nameserver 4.2.2.2' >> /etc/resolvconf/resolv.conf.d/base
sudo echo 'nameserver 8.8.4.4' >> /etc/resolvconf/resolv.conf.d/base
sudo resolvconf -u

sudo echo 'DNS=8.8.8.8' >> /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service

wget https://github.com/marklma/newvps/raw/main/shadowsocks.json
sudo mv ./shadowsocks.json /etc/shadowsocks.json

dpkg-reconfigure locales
sudo nano /etc/shadowsocks.json

sudo passwd mark
sudo passwd user

tightvncserver :1
sudo tightvncserver -kill :1
sudo echo 'lxterminal &' >> /root/.vnc/xstartup
sudo echo '/usr/bin/lxsession -s LXDE &' >> /root/.vnc/xstartup
