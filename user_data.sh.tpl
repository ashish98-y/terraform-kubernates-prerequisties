#! /bin/bash -v
# install kops
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#set bucket and clusterName
echo "" >> ~/.bashrc
echo "export KOPS_CLUSTER_NAME=${bucketName}" >> ~/.bashrc
echo "export KOPS_STATE_STORE=s3://${bucketName}" >> ~/.bashrc
source ~/.bashrc