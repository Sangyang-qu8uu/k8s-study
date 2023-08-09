常用apt源安装

1.常使用linux安装命令ifconfig

```
sudo apt install net-tools
```

2.安装ping命令

```
apt install -y inetutils-ping
```

3.安装netstat

```
apt install net-tools
netstat -nlpt|grep 80
```

4.安装rz或者sz命令

```
apt install lrzsz
```

5.安装打包解压

```
sudo apt-get update
sudo apt-get install zip
2.解压缩zip源码包
unzip xxx.zip
3.打包
zip [参数] [压缩包名] [文件/文件夹路径]
zip -r myfolder.zip myfolder
```

