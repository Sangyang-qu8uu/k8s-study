linux常用命令（少部分windows的命令)

1.删除或者建立软连接

```shell
unlink link_name
```

```shell
sudo ln -s ~/startup.sh /etc/init.d/startup
```

2.如何杀掉windows的指定进程 

```shell
netstat -ano|findstr "端口号"
tasklist|findstr "PID号"   
taskkill /f /t /im 端口号
```

3.windows刷新hosts 

```shell
ipconfig /displaydns
```

4.查看某个文件并且高亮显示

```
查看带有关键字的日志的前后100行： 
grep -C  100  "关键字"  日志名 （--color{--color的意思是使关键字高亮}）
```

5.awk使用

```shell
#查询这个jar的进程并且kill掉
ps -ef|grep XXXX.jar |grep -v grep | awk '{print $2}'| xargs kill -9
```

6.查询机器的串口

```sh
ls  /dev/tty*
```

7.启动sh的脚本不需要打印日志

```sh
sh *.sh  >/dev/null 2>&1 &
```

8.查看服务器的cpu核数

```
##1.使用 nproc 命令：
nproc
##2.使用 lscpu 命令
lscpu
##3.使用 cat 命令读取 /proc/cpuinfo 文件
cat /proc/cpuinfo | grep "processor" | wc -l

这些命令将返回系统中可用的逻辑核心数。如果您想获取物理核心数，通常可以在 lscpu 的输出中查找 "Core(s) per socket" 或类似的行。不过，需要注意的是，如果您的处理器支持超线程（同时运行多个线程在同一个核心上），逻辑核心数可能会比物理核心数多。
```

9添加用户

```
useradd -m <username>
passwd <username>
```

