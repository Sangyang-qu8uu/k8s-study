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

10.给文件夹赋予相应权限

在root用户登录的情况，赋予opt目录给XX这个用户权限 示例代码：

```
# 将目录/opt 及其下面的所有文件、子目录的文件主改成 liuhai
chown -R ruoyi:ruoyi /usr/local/java
#给目录opt设置权限
chmod 760 /usr/local/java

```

11.将前端dist打包

```
zip -r dist.zip dist/
zip -r /path/to/output/example_folder.zip /path/to/input/example_folder
```

12.追加命令

```sh
echo "127.0.0.1 9b63314f-8bef-4eda-997b-70b996049626" | sudo tee -a /etc/hosts

```
13.查看硬盘大小 

```shell
递归查看目录及其子目录的大小
使用 du 命令来递归地查看特定目录及其子目录的大小。常用选项如下：

-h: 以人类可读的格式（如K、M、G）显示大小
-s: 显示总计
--max-depth=N: 限制显示的目录深度
du -h --max-depth=1 /path/to/directory
```
