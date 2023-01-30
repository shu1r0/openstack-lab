#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt install -y build-essential 
sudo apt install -y git
sudo apt install -y chrony
sudo apt install -y openssh-server
sudo apt install -y python3-dev
sudo apt install -y bridge-utils
sudo apt install -y debootstrap 
sudo apt install -y vlan 
sudo apt install -y linux-modules-extra-`uname -r`

# OpenStack
sudo apt install -y python3-openstackclient

## For japanese
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