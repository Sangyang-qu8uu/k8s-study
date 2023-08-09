linux常用命令（少部分windows的命令)

1.删除或者建立软连接

```
unlink link_name
```

```
sudo ln -s ~/startup.sh /etc/init.d/startup
```

2.如何杀掉windows的指定进程 

```
netstat -ano|findstr "端口号"
tasklist|findstr "PID号"   
taskkill /f /t /im 端口号
```

3.windows刷新hosts 

```
ipconfig /displaydns
```

