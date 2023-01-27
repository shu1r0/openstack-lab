#!/bin/bash


sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo gpasswd -a stack vagrant
sudo chmod +x /opt/stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

sudo git clone https://opendev.org/openstack/devstack
sudo chown -R stack:vagrant devstack
cd devstack
cat <<EOF > ./local.conf
[[local|localrc]]
ADMIN_PASSWORD=password
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
HOST_IP=192.168.110.10
EOF
sudo -u stack  ./stack.sh
