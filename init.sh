#!/bin/bash

#IMPORT KEYS AND REPOSITORIES
sudo apt-key add /vagrant/dockergpg
echo "deb http://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update

#INSTALL REQUIRED PACKAGES
sudo apt-get install apt-transport-https ca-certificates -y
#sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y


#INSTALL DOCKER
sudo apt-get install docker-engine -y
sudo su
echo 'export http_proxy='$1 >> /etc/default/docker
echo 'export https_proxy='$1 >> /etc/default/docker
echo 'export no_proxy="localhost, 127.0.0.1"' >> /etc/default/docker

#INSTALL DOCKER-COMPOSE
#sudo apt-get -y install python-pip
#sudo pip install --proxy http://squid.eurodyn.com:8080 docker-compose
#sudo su
#curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
sudo cp /vagrant/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo service docker restart

#ADD USERS TO DOCKER GROUP
sudo usermod -a -G docker vagrant
