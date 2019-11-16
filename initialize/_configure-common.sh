#!/bin/bash
# ======================
#    Configure Ubuntu
# ======================
sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone Asia/Tokyo

sudo fallocate -l 1g /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile 
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab
sudo swapon -a

sudo apt-get install xsel

# ==================
#     add alias
# ==================
echo 'alias la="ls -a"' >> ~/.bash_profile
echo 'alias ll="ls -l"' >> ~/.bash_profile
echo 'alias pbcopy="xsel --clipboard --input"' >> ~/.bash_profile
