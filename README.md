# k8s-study以及运维相关学习
1.常使用linux安装命令ifconfig

```
sudo apt install net-tools
```

2.windows刷新hosts

```
ipconfig /displaydns
```

3.安装ping命令

```
apt install -y inetutils-ping
```

4.安装netstat

```
apt install net-tools
netstat -nlpt|grep 80
```

5.如何杀掉windows的指定进程

```
netstat -ano|findstr "端口号"
tasklist|findstr "PID号"   
taskkill /f /t /im 端口号
```

6.安装rz或者sz命令

```
apt install lrzsz
```

7.删除或者建立软连接

```
**unlink link_name**
sudo ln -s ~/startup.sh /etc/init.d/startup
```

