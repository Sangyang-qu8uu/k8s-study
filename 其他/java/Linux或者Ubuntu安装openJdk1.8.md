# Ubuntu安装openJdk1.8

## 1.执行命令

```sh
sudo apt-get install openjdk-8-jdk
```

## 2.验证

```sh
java -version
```

## 3.卸载jdk

```sh
先检查是否安装，命令：dpkg --list | grep -i jdk
移除openjdk包，命令：apt-get purge openjdk*
卸载 OpenJDK 相关包，命令：apt-get purge icedtea-* openjdk-*
再次检查是否卸载成功，命令：dpkg --list | grep -i jdk
```

