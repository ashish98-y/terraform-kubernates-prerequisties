after prerequisites are installed
#
vi ~/.bashrc

export KOPS_CLUSTER_NAME=my-98ashishy-bucket.in

export KOPS_STATE_STORE=s3://my-98ashishy-bucket.in

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
--master-count 1 \
--out=. \
--target=terraform

# create cluster
kops update cluster --yes

# deploy to cluster

login cluster master

ssh admin@api.${KOPS_CLUSTER_NAME}

wget /<url of pod.yml/>

wget /<url of service.yml/>

kubectl create -f pod.yml /<or url of pod.yml/>

kubectl create -f service.yml /<or url of service.yml/>
  
kubectl get svc

external ip of loadbalancer will have our app running

kubectl describe svc /<name of service.yml/>
