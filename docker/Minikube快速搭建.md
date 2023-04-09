# Minikube快速搭建

1.用 curl 在 Linux 系统中安装 kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

2.安装 kubectl 

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

说明：

即使你没有目标系统的 root 权限，仍然可以将 kubectl 安装到目录 `~/.local/bin` 中：

````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# 之后将 ~/.local/bin 附加（或前置）到 $PATH
````

3.执行测试，以保障你安装的版本是最新的： 

```
kubectl version --client
```

说明：

上面的命令会产生一个警告：

```
WARNING: This version information is deprecated and will be replaced with the output from kubectl version --short.
```

或者使用如下命令来查看版本的详细信息： 

```
kubectl version --client --output=yaml
```

4.启用 shell 自动补全功能

```
apt-get install bash-completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
source ~/.bashrc
```

5.安装源文件

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
网速慢选择下面
curl -LO https://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v1.23.1/minikube-linux-amd64
#设置驱动器
minikube config set driver docker
#运行 注意 默认方式我尝试失败 选用下边方式成功
minikube start --driver=docker
#指定kubernetes版本方式启动成功
minikube start --image-mirror-country='cn' --force --kubernetes-version=v1.23.1
#推荐使用：指定国内镜像源 下载镜像更快一些
minikube start --image-mirror-country='cn' --force --kubernetes-version=v1.23.1 --registry-mirror="https://docker.mirrors.ustc.edu.cn"
#查看是否安装成功
minikube status
#停止minikube服务
minikube stop
```

6.添加别名

```
环境变量中添加alias 可以使用kubectl
cd ~
vim .bashrc
#添加如下内容并保存
alias kubectl="minikube kubectl --"
#生效
source .bashrc
#测试
kubectl get pods -A
```

7.常用命令

```
#查看插件列表
minikube addons list
#安装插件dashboard
minikube addons enable dashboard
#查看连接
minikube dashboard --url &
如果你是Linux环境安装的想要windows看到执行下面命令
kubectl proxy --port=9527 --address='192.168.1.71' --accept-hosts='^.*' &@ 
#进入minikube虚拟机 root密码应该与宿主机root密码一致（臆测）
minikube ssh
#获取ip
minikube ip
#宿主机目录影射虚拟机（亲测不好使报错未找到解决办法）
#&，表示命令在后台运行。minikube虚拟机重启后，挂载文件夹消失，即挂载是一次性的
minikube mount /nfs/data:/nfs/data &
#另一种往minikube里传文件方式 scp 会提示minikube root密码 即为宿主机root密码
scp ./file.tar root@192.168.*.*:/mnt/
#开启metrics-server 指标监控
minikube addons enable metrics-server
#查看性能指标
k top node
k top pod
#开启LoadBalancer 和Ingress 以便暴露内部服务的访问
minikube addons enable metallb
minikube addons enable ingress

```

8.再次启动

```
minikube start
```

9.集群操作

```
#暂停
minikube pause
#恢复
minikube unpause
```

参考官网：

[minikube start | minikube (k8s.io)](https://minikube.sigs.k8s.io/docs/start/) 