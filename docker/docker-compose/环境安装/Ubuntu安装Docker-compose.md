# Centos安装Docker环境

1.下载docker-compose对应系统的架构的二进制文件

```shell
https://github.com/docker/compose/releases/tag/v2.25.0
```

2.移动到/usr/bin目录下

```
mv docker-compose-linux-x86_64 /usr/bin/docker-compose
```

3.添加可执行权限

```
sudo chmod +x /usr/local/bin/docker-compose
```

3.测试安装结果

```
docker-compose --version
```






