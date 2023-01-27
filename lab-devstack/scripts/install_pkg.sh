#!/bin/bash


sudo apt -y update
sudo apt -y upgrade

sudo apt -y install build-essential
sudo apt -y install sshpass
sudo apt -y install python3-dev
sudo apt -y install python3-pip

python3 -m pip install -U pip

sudo apt -y install libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev
sudo apt -y install git
sudo apt -y install curl
sudo apt -y install wireshark-dev

sudo pip3 install --upgrade pip
sudo pip3 install grpcio grpcio-tools
sudo pip3 install pyshark
sudo pip3 install scapy
sudo pip3 install mininet
sudo pip3 install aiohttp
sudo pip3 install python-socketio
sudo pip3 install flask
sudo pip3 install flask_socketio
sudo pip3 install macaddress
sudo pip3 install pyroute2

sudo apt install -y libnetfilter-queue-dev
sudo pip3 install NetfilterQueue


sudo timedatectl set-timezone Asia/Tokyo

sudo cat << 'EOF' | sudo tee /etc/default/keyboard
# KEYBOARD CONFIGURATION FILE
# Consult the keyboard(5) manual page.
XKBMODEL="pc105"
XKBLAYOUT="jp"
XKBVARIANT=""
XKBOPTIONS=""
BACKSPACE="guess"
EOF


sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
