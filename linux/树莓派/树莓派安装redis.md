树莓派安装redis

1.更新apt源文件

```shell
sudo apt-get update
sudo apt-get upgrade
```

2.安装

```shell
sudo apt-get install redis-server
```

3.启动

```
sudo service redis-server start
```



4.配置远程访问和密码端口

```
vi /etc/redis/redis.conf
```

找到被注释掉的  `bind，分别对其取消注释和增加注释。保存后重启服务。 

```
bind 0.0.0.0
port 6397
requirepass 123456
```

5.服务器自启动

```
sudo update-rc.d redis-server defaults
```

6.补充命令

```
sudo systemctl status redis-server
sudo systemctl restart redis-server
sudo systemctl start redis-server
sudo systemctl stop redis-server
##卸载服务
sudo apt-get autoremove --purge redis-server
```

