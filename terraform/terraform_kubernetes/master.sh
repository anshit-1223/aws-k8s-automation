#!/bin/bash
apt update
apt install htop
apt install net-tools -y
sudo hostnamectl set-hostname master-node
echo 'ubuntu:ubuntu' | sudo chpasswd
sudo sed -i 's/^PasswordAuthentication no$/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/*.conf
sudo systemctl restart ssh