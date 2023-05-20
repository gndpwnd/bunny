#!/bin/bash

# Update and upgrade the system
sudo apt update
sudo apt upgrade -y

# Install required packages
sudo apt install sshpass -y

# Copy SSH public key from Ansible control node
sshpass -p 'your_remote_password' scp -o StrictHostKeyChecking=no ansible_user@ansible_control_node:/path/to/public_key /tmp/id_rsa.pub

# Create SSH directory and set permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Add public key to authorized keys file
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Cleanup
rm /tmp/id_rsa.pub
