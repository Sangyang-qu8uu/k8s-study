# Ubuntu安装Docker环境

1.安装docker-compose

```shell
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

2.添加可执行权限

```
sudo chmod +x /usr/local/bin/docker-compose
```

3.测试安装结果

```
docker-compose --version
```

4.docker-compose使用

```
sudo docker-compose -f docker-compose-env.yml up -d  
```

卡顿了

```
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
```



5.报错

```
/usr/local/bin/docker-compose: line 1: html: No such file or directory
/usr/local/bin/docker-compose: line 2: syntax error near unexpected token `<'
'usr/local/bin/docker-compose: line 2: `<head><title>502 Bad Gateway</title></head>

```

使用下面的命令解决

```
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
```

```
 chmod +x /usr/local/bin/docker-compose
```

最后查看版本

![](../../pic/docker_compose_install.png)

报错解决

library initialization failed - unable to allocate file descriptor table - out of memory

起因是使用docker-compsoe搭建的zk+kafka报错，之前正常使用突然异常了

解决方案

排查: 搜索一下，发现是 ulimit 参数问题在 */etc/systemd/system/* 或者 */usr/lib/systemd/system/*
找到 docker.service 文件，在 ExecStart=/usr/bin/dockerd 后面添加 --default-ulimit nofile=65536:65536 参数

重启 docker 生效

> systemctl daemon-reload
>
> systemctl restart docker

参考:https://www.cnblogs.com/iyiluo/p/16785601.html

