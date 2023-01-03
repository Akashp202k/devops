#!/bin/bash

echo "envSetup for ubuntu initiated ..."

echo "##############################################################"
echo "Updating system ..."
echo "##############################################################"
sudo apt update

echo "##############################################################"
echo "Installing required packages ..."
echo "##############################################################"

sudo apt install wget zip unzip apache2 -y

echo "##############################################################"
echo "Installing docker ..."
echo "##############################################################"

sudo apt update 
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world 

echo "docker installed successfully ..."


echo "##############################################################"
echo "Installing aws-cli ..."
echo "##############################################################"

sudo apt update
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
aws --version

echo "aws-cli installed successfully ..."


echo "Below packages/software are installed "
echo "1. wget zip unzip apache2"
echo "2. docker engine for ubuntu"
echo "3. awscli"







