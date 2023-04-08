# Ubuntu安装Docker环境

1.先卸载旧版，如果没有的话，就不用执行了，直接第二步。

```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
```

2.更新源

```
sudo apt update
sudo apt-get install ca-certificates curl gnupg lsb-release
```

3.安装证书

```
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
```

4.写入软件源信息

```
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
```

5.安装

```
sudo apt-get install docker-ce docker-ce-cli containerd.io
中途出现问题的话，使用  sudo apt-get update 试试
```

6.启动docker

```
sudo systemctl start docker
```

7.安装工具

```
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
```

8.重启docker

```
sudo service docker restart
```

9.开机自启动

```
sudo systemctl enable docker --now
```

10.切换镜像源

```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://16fcpbbd.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

