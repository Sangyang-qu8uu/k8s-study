Jenkins整合ruoyi-cloud流水线

1.安装环境与工具的准备

jdk11

jenkins

nodejs16

maven

gitlab(代码托管)，可以选择gitee,或者github代码托管工具替代

sonarqb(代码检测)，可以不装

2.代码仓库gitlab上传好前后端项目

![](../pic/gitlab项目地址.png)

后端:

```
http://192.168.1.205:9000/root/ruoyi-cloud.git
```

前端:

```
http://192.168.1.205:9000/root/ruoyi-ui.git
```

记录下来后面用到

3.项目运行需要的中间件

```
nacos2.1.1
mysql
redis
```

mysql安装

````
docker run -p 3306:3306 --name mysql-01 \
-v /mydata/mysql/log:/var/log/mysql \
-v /mydata/mysql/data:/var/lib/mysql \
-v /mydata/mysql/conf:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=root \
--restart=always \
-d mysql:5.7 
````

redis安装

```
#创建配置文件
## 1、准备redis配置文件内容
mkdir -p /mydata/redis/conf && vim /mydata/redis/conf/redis.conf


##配置示例
appendonly yes
port 6379
bind 0.0.0.0


#docker启动redis
docker run -d -p 6379:6379 --restart=always \
-v /mydata/redis/conf/redis.conf:/etc/redis/redis.conf \
-v  /mydata/redis-01/data:/data \
 --name redis-01 redis:6.2.5 \
 redis-server /etc/redis/redis.conf
```

nacos安装

```
下载tar.gz包
https://github.com/alibaba/nacos/tags
```

