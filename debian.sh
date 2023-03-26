#!/bin/bash

screen
screen -ls

mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime



sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install tmux -y
sudo apt-get install lxde-core -y

sudo apt-get install xrdp xorgxrdp -y
sudo adduser xrdp ssl-cert
sudo apt-get purge xterm

sudo apt-get install language-pack-zh-hans language-pack-zh-hant-base language-pack-zh-hant language-pack-zh-hans -y
sudo apt-get install fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-ukai ttf-wqy-zenhei  zhcon  -y

sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"

apt-get install python-pip -y
sudo apt install libsodium-dev m2crypto -y

sudo apt-get install ufw -y

sudo useradd -d /home/mark -m -s /bin/bash mark
chmod u+w /etc/sudoers
sudo echo 'mark ALL=(ALL) ALL' >> /etc/sudoers
chmod u-w /etc/sudoers

sudo apt clean

echo "nameserver 1.1.1.1" > /etc/resolv.conf
sudo resolvconf -u

sudo echo "DNS=8.8.8.8 4.2.2.2 8.8.4.4" >> /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service

dpkg-reconfigure locales

sudo passwd mark

su mark
mkdir ~/.ssh
cd ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEuDyHtS2MhAXjYe4pmAdTfENi6blwvw6/oW6G3CfuhZQjeeTs0yrdKFTJMXvUjro6TyldVZo83SCZ+e73fwPH4anc9BUxX6ovlPmMsNyoNkwwzH/ZapJUkoWqMO7BUlketJOopmVqtjyvxNjaea6kJtsvX71o7nPljb5XN8qiFTrFh8/GT21UeKkTEe7gSsaBq5kx6K4wYHpjDZr8j/k0LAuB8wRMfwGRlGJJlY/2D+G6IUzf9sPakqAoFQ3DUQWHRJfTj83Ju2P62UVxuBOuz2zfYzPpDF1zRwt87E5gJA7BMk7Jq9I0eMpCfz4Ikur4iPM4uGKHcuHnQALBvORX hostvds" > ~/.ssh/authorized_keys
