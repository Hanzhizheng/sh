if [ "$1" == "node" ]
then
  #echo "node"
  images=(kube-proxy-amd64:v1.9.2 kubernetes-dashboard-amd64:v1.8.2)
else
  #echo "master"
  images=(kube-proxy-amd64:v1.9.2 kube-scheduler-amd64:v1.9.2 kube-controller-manager-amd64:v1.9.2 kube-apiserver-amd64:v1.9.2 etcd-amd64:3.1.11 pause-amd64:3.0 k8s-dns-dnsmasq-nanny-amd64:1.14.7 k8s-dns-kube-dns-amd64:1.14.7 k8s-dns-sidecar-amd64:1.14.7 kubernetes-dashboard-amd64:v1.8.2)
fi
for imageName in ${images[@]}; do
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
  docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName gcr.io/google_containers/$imageName
  docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
