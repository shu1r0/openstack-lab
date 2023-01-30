#!/bin/bash


sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -N ""
sudo chmod 644 /home/vagrant/.ssh/id_rsa

sudo apt-get install -y sshpass
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no /home/vagrant/.ssh/id_rsa.pub vagrant@172.16.0.11:/home/vagrant/
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.11 "cat id_rsa.pub | tee -a .ssh/authorized_keys"
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.11 "cat id_rsa.pub | sudo tee -a /root/.ssh/authorized_keys"
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no /home/vagrant/.ssh/id_rsa.pub vagrant@172.16.0.12:/home/vagrant/
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.12 "cat id_rsa.pub | tee -a .ssh/authorized_keys"
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.12 "cat id_rsa.pub | sudo tee -a /root/.ssh/authorized_keys"


sudo ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""
sudo chmod 644 /root/.ssh/id_rsa
sudo sshpass -p "vagrant" scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub vagrant@172.16.0.11:/home/vagrant/id_rsa_root.pub
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.11 "cat id_rsa_root.pub | tee -a .ssh/authorized_keys"
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.11 "cat id_rsa_root.pub | sudo tee -a /root/.ssh/authorized_keys"
sudo sshpass -p "vagrant" scp -o StrictHostKeyChecking=no /root/.ssh/id_rsa.pub vagrant@172.16.0.12:/home/vagrant/id_rsa_root.pub
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.12 "cat id_rsa_root.pub | tee -a .ssh/authorized_keys"
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@172.16.0.12 "cat id_rsa_root.pub | sudo tee -a /root/.ssh/authorized_keys"
