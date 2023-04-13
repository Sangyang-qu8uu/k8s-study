# Kuboard安装

1.uboard v3 在 K8S 中的安装（主）

```
kubectl apply -f https://addons.kuboard.cn/kuboard/kuboard-v3-swr.yaml
#等待 Kuboard v3 就绪
watch kubectl get pods -n kuboard
访问Kuboard

网址：your-node-ip-address:30080
用户名：admin
密码：Kuboard123

```

2.Kuboard NFS

2.1在master节点中安装nfs客户端和服务器端

```
apt-get install nfs-common
sudo apt-get install nfs-kernel-server
#共享目录配置文件
#nfs主节点
echo "/nfs/data/ *(insecure,rw,sync,no_root_squash)" > /etc/exports
#启动NFS服务
sudo /etc/init.d/nfs-kernel-server restart

```

3Kuboard创建存储类

登陆Kuboard，点击集群管理->存储->存储类->创建存储类

```
存储类名称：随便填
限定名称空间：不勾选
存储类类型：NFS
NFS Server：master节点的ip
NFS Path ：/nfs/data （上面共享的目录）
NFS可使用容量：100Gi （只是可使用，不分配空间）
MountOptions：vers=4,minorversion=0,noresvport
根据提示在master中先行测试，若测试报错，可尝试不要noresvport，或将vers改为5
一路保存+确定
```

参考文档资料地址:

[在ubuntu18.04上搭建kubernetes（保姆级教程）_Mr. Water的博客-CSDN博客](https://blog.csdn.net/narcissus2_/article/details/119423389) 