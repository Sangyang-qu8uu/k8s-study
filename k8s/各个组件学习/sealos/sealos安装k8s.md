sealos安装k8s

一.环境准备3台服务器 ,2台master1台worker

1.vi编辑工具包下载

```
apt-get install vim
```

2.修改host其他主机信息

```
192.168.203.157 sealos1
192.168.203.158 sealos2
192.168.203.159 sealos3
```

3.关闭防火墙

```
sudo apt-get install ufw
sudo ufw disable
```

4.镜像加速

```
#unqualified-search-registries = ["registry.fedoraproject.org", "registry.access.redhat.com", "registry.centos.org", "docker.io"]

unqualified-search-registries = ["docker.io"]
[[registry]]
location ="jpf8vvi5.mirror.aliyuncs.com"
```

6.时间同步

```
ubuntu更改时区（东八区）
tzselect
```

```
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

7关闭分区

```
临时关闭
swapoff -a

永久关闭
vi /etc/fstab
```



root用户设置密码访问

````
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
````



1.sealos 安装

```
echo "deb [trusted=yes] https://apt.fury.io/labring/ /" | sudo tee /etc/apt/sources.list.d/labring.list
sudo apt update
sudo apt install sealos
```

神秘代码

```
sed -i "s#phase: ClusterFailed#phase: ClusterSuccess#g" /root/.sealos/default/Clusterfile
```



1.集群安装 Kuberentes

```
sealos run labring/kubernetes-docker:v1.20.5-4.1.3 labring/helm:v3.8.2 \
     --masters 192.168.1.148,192.168.1.25 \
     --nodes 192.168.1.47 -p 1
```





rancher使用







```
sudo docker run -e CATTLE_AGENT_IP="192.168.1.148"  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.1.148:8087/v1/scripts/900F7C15DE551669BABA:1672444800000:cWkeZKcLRV1Fj8KIg2ZYtkJIyL8
```





```
sealos run labring/kubernetes-docker:v1.20.5-4.1.3 labring/helm:v3.8.2      --masters 192.168.1.171,192.168.1.172,192.168.1.173      --nodes 192.168.1.174 -p 1
```



kubectl top nodes



```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

vi components.yaml

```
image: lizhenliang/metrics-server:v0.3.7  # 这个地址可以使用
```



````
kubectl apply -f components.yaml
````

重新生成

```
kubectl create clusterrolebinding dashboard-cluster-admin1 --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:kubernetes-dashboard

```

