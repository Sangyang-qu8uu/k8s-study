# kubernetes部署

1.环境准备

```
ubuntu-22.10-live-server-amd64
Docker version 23.0.3, build 3e7cbfd
k8s: 1.21.3
```

1.1vi编辑工具包下载 

```
#方便修改用户名密码，以及主机信息
apt-get install vim

vi /etc/ssh/sshd_config

# Authentication:
LoginGraceTime 120
#PermitRootLogin without-password
PermitRootLogin yes
StrictModes yes

重启ssh服务
 /etc/init.d/ssh restart
 
 重新修改密码
 sudo passwd root
 
```

1.2关闭分区 

```
#临时关闭
swapoff -a

#永久关闭
vi /etc/fstab
```

1.3时间同步 

```
ubuntu更改时区（东八区）
tzselect
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

1.4关闭防火墙

```
sudo apt-get install ufw
sudo ufw disable
```

1.5添加其他的主机信息

```
192.168.1.90 k2
192.168.1.238 k3
```

1.6关闭selinux

```
sudo apt install selinux-utils
setenforce 0
```

1.7桥接的IPV4流量传递到Iptables

```
cat > /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system #生效

```

1.8配置Docker环境

1.9配置k8s资源

```
curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
```

1.10安装kubeadm(初始化cluster)，kubelet(启动pod)和kubectl(k8s命令工具)

```
apt install -y kubelet=1.21.3-00 kubeadm=1.21.3-00 kubectl=1.21.3-00
```

1.11设置开机启动并启动kubelet

```
systemctl enable kubelet && systemctl start kubelet
```

2.拉取镜像,新建脚本k8s.sh

```
#!/bin/bash
images=(
 kube-apiserver:v1.21.3
 kube-controller-manager:v1.21.3
 kube-scheduler:v1.21.3
 kube-proxy:v1.21.3
 pause:3.2
 etcd:3.4.13-0
)
for imageName in ${images[@]} ; do
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/${imageName}
  docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/${imageName} k8s.gcr.io/${imageName}
  docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/${imageName}
done
docker pull coredns/coredns:1.8.0
docker tag coredns/coredns:1.8.0 registry.aliyuncs.com/google_containers/coredns:v1.8.0
docker rmi coredns/coredns:1.8.0

```

然后执行./k8s.sh

3.初始化Master

```
kubeadm init --image-repository=registry.aliyuncs.com/google_containers  --pod-network-cidr=10.244.0.0/16	 --service-cidr=10.96.0.0/12
```

4.使用kubectl

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

5.加入子节点

```
kubeadm join 172.16.1.90:6443 --token 9pslv8.6tbrux0ksur0wgav --discovery-token-ca-cert-hash sha256:3709a3ce5a0ec819308d97a97c445a0414b0ed07a855cb3f948c288f38c7e35c 
若没有记录，也可在master节点用以下操作获取：kubeadm token create --print-join-command
```

6.安装网络插件flannel 

```
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl get cs
```

7.解决组件状态Unhealthy

```
需要用#注释掉/etc/kubernetes/manifests下的kube-controller-manager.yaml和kube-scheduler.yaml的- – port=0

注释完后重启服务
systemctl restart kubelet.service
再次查看组件状态（需要稍等）
kubectl get cs
查看节点状态
kubectl get node
```

