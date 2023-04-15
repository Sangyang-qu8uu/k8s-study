# Docker基本命令

## 一：镜像相关

### 1.查看镜像

```
# 查看所有
docker images
# 查看某个镜像
docker search redis:latest(默认不加版本信息就是最新版本，redis可以替换成为其他的镜像名字)

```

### 2.拉取镜像

```
docker pull 镜像名
docker pull 镜像名:Tag
```

### 3.删除镜像

```
docker rmi -f 镜像名/镜像ID
# 删除所有的镜像
docker rmi -f $(docker images -aq)
```

### 4.保存镜像

将我们的镜像 保存为tar 压缩文件 这样方便镜像转移和保存 ,然后 可以在任何一台安装了docker的服务器上 加载这个镜像 

```
docker save 镜像名/镜像ID -o 镜像保存在哪个位置与名字
```

### 5.加载镜像

```
docker load -i 镜像保存文件位置
docker load -i flanneld-v0.20.2-amd64.docker
```

### 6.镜像重命名并且推送镜像

```
docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname
```

```
# 把旧镜像的名字，改成仓库要求的新版名字
docker tag quay.io/coreos/flannel:v0.20.2-amd64 16074yang/flannel:v1

# 登录到docker hub
docker login       


docker logout（推送完成镜像后退出）

# 推送
docker push 16074yang/flannel:v1


# 别的机器下载
docker pull 16074yang/flannel:v1
```

### 7.查看命令镜像的详细信息

```
docker image inspect java-demo:v1.0
```



## 二：容器相关

### 1.查询容器

```
#所有的
docker ps
#运行和停止的
docker ps -a
```

### 2.创建容器

比如这个是gitlab容器的创建命令

```
docker run \
-d \
-p 20180:80 \
-p 20122:22 \
--restart always \
-v /data/gitlab/config:/etc/gitlab \
-v /data/var/log/gitlab:/var/log/gitlab \
-v /data/gitlab/data:/var/opt/gitlab \
--name gitlab \
gitlab/gitlab-ce:8.16.7-ce.0

```

```
-d：容器在后台运行。容器平台都是以后台的形式来运行容器，所以本参数不需要在容器控制台指定。
-p：指定端口映射。这里映射了两个端口，容器端口分别是80和22，对外暴露的端口分别是20180和20122
--restart：本参数用于指定在容器退出时，是否重启容器。容器平台创建的所有容器退出时，都会重启容器，所以本参数不需要在容器控制台指定
-v 将容器内的指定文件夹挂载到宿主机对应位置
--name 给要运行的容器 起的名字
```

### 3.停止容器

```
docker stop 容器名/容器ID
```

### 4.删除容器

````
#删除一个容器
docker rm -f 容器名/容器ID
#删除多个容器 空格隔开要删除的容器名或容器ID
docker rm -f 容器名/容器ID 容器名/容器ID 容器名/容器ID
#删除全部容器
docker rm -f $(docker ps -aq)
````

### 5.进入容器

````
docker attach 容器ID/容器名
# 进入容器内部的系统，修改容器内容
docker exec -it 容器id  /bin/bash
````

### 6.查看容器相关的日志

```
docker logs 容器名/id   排错
```

### 7.容器与服务器之间拷贝

```
#把容器指定位置的东西复制出来 
docker cp 5eff66eec7e1:/etc/nginx/nginx.conf  /data/conf/nginx.conf
#把外面的内容复制到容器里面
docker cp  /data/conf/nginx.conf  5eff66eec7e1:/etc/nginx/nginx.conf
```

