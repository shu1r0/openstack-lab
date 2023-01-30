#!/bin/bash

sudo cp /home/vagrant/share/controller/installer_config.yaml /etc/netplan/00-installer_config.yaml
sudo netplan apply

sudo pvcreate --metadatasize 2048 /dev/sdb
sudo vgcreate cinder-volumes /dev/sdb
