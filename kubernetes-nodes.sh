#!/bin/bash

#UBUNTU_VERSION=18.04
#K8S_VERSION=1.11.3-00
#node_type=master

#Update all installed packages.
apt-get update -y
apt-get upgrade -y

#if you get an error similar to
#'[ERROR Swap]: running with swap on is not supported. Please disable swap', disable swap:
#sudo swapoff -a

# install some utils
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get update
sudo apt-get install -y docker.io

#Install NFS client
sudo apt-get install -y nfs-common

#Enable docker service
sudo systemctl enable docker.service

#Update the apt source list
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

#Install K8s components
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl




echo "Done."
