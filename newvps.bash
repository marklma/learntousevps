#!/bin/bash
wget https://github.com/marklma/learntousevps/raw/main/sources.list
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv ./sources.list /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y

apt-get install python-pip -y
sudo apt install libsodium-dev m2crypto
sudo apt-get install wicd -y
sudo apt-get install lxpolkit -y
sudo apt-get install gnome-system-tools -y
sudo apt-get install udisks2 -y
sudo apt-get install gnome-disk-utility -y
sudo apt-get install lxde-core -y
sudo apt-get install lxde -y
sudo apt-get install xrdp -y
sudo apt-get purge xterm
