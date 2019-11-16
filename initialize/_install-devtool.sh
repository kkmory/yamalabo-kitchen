#!/bin/bash
# ====================
#      Dev Tools
# ====================
sudo apt update && sudo apt upgrade -y
sudo apt install -y ssh git nano expect curl chkrootkit build-essential clang cmake golang

# ====================
#    Install docker
# ====================
sudo apt update
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     software-properties-common
# Add to apt repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
sudo apt update
# Install docker and configure
sudo apt install -y docker-ce
sudo gpasswd -a yamalabo docker
sudo chmod 666 /var/run/docker.sock
# Install docker-compose
export compose='1.24.1'
sudo curl -L https://github.com/docker/compose/releases/download/${compose}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod 0755 /usr/local/bin/docker-compose

# ==================
#    install ruby
# ==================
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL -l
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.6.5
rbenv rehash
rbenv global 2.6.5
