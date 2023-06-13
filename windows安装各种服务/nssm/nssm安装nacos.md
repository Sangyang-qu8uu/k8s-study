# nssm安装nacos

## 1.修改nacos的配置文件

```sh
set MODE="standalone"
```

![nacos配置文件修改1.png](pic/nacos配置文件修改1.png)



![nacos配置文件修改2.png](pic/nacos配置文件修改2.png)



## 2.**将下载好的nssm放置到这个目录下面，并win+r输入命令,安装如图所示填入信息，最后install一下** 

```sh
nssm install nacos
```

![nssm安装路径.png](pic/nssm安装路径.png)

## 3.最后在我的电脑中管理，启动这个服务

![windows打开服务.png](pic/windows打开服务.png)

## 4**.打开localhost:8848/nacos** 

![nacos启动.png](pic/nacos启动.png)