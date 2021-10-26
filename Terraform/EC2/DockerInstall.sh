#!/bin/bash
#Install Docker
sudo apt-get update
sudo apt install curl -y
curl https://get.docker.com | sudo bash
sudo usermod -aG docker ubuntu
# sudo usermod -aG jenkins
##Now Installing Docker-Compose
sudo apt install -y curl jq
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
newgrp docker
##For Production Deployment using Kubernetes we need to install the AWS CLI
#sudo apt install -y unzip
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install
##We then need to install kubectl to buiild our clusters with
# download
#curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# make executable
#chmod +x kubectl
# install the binary onto your PATH
#sudo mv ./kubectl /usr/local/bin/kubectl