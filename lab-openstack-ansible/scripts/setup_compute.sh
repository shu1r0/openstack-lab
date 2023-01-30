#!/bin/bash


sudo cp /home/vagrant/share/compute/installer_config.yaml /etc/netplan/00-installer_config.yaml
sudo netplan apply
