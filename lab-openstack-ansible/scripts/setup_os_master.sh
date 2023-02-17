#!/bin/bash


sudo cp /home/vagrant/share/master/installer_config.yaml /etc/netplan/00-installer_config.yaml
sudo netplan apply


git clone -b stable/yoga https://github.com/openstack/openstack-ansible.git /opt/openstack-ansible

cd /opt/openstack-ansible/scripts/
./bootstrap-ansible.sh

sudo cp -a /opt/openstack-ansible/etc/openstack_deploy /etc/openstack_deploy
cd /etc/openstack_deploy
sudo cp /home/vagrant/share/master/openstack_user_config.yml ./openstack_user_config.yml
sudo cp /home/vagrant/share/master/user_variables.yml ./user_variables.yml

cd /opt/openstack-ansible/
./scripts/pw-token-gen.py --file /etc/openstack_deploy/user_secrets.yml

cd /opt/openstack-ansible/playbooks
sudo openstack-ansible setup-hosts.yml
sudo openstack-ansible setup-infrastructure.yml
sudo openstack-ansible setup-openstack.yml