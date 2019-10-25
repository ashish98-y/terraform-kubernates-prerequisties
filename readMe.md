after prerequisites are installed
#
vi ~/.bashrc
export KOPS_CLUSTER_NAME=my98ashishy.in
export KOPS_STATE_STORE=my-98ashishy-bucket.in
source ~/.bashrc

# to login to cluster
ssh-keygen

# create cluster plan
kops create cluster \
--state=${KOPS_STATE_STORE} \
--node-count=2 \
--master-size=t2.micro \
--node-size=t2.micro \
--zones=ap-south-1a,ap-south-1b \
--name=${KOPS_CLUSTER_NAME} \
--dns private \
--master-count 1
--out=. \
--target=terraform

# create cluster
kops update cluster --yes
