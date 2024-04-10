# DockerHub自定义版本镜像操作

## 1.自定义镜像

````sh
#arm64架构
docker build -t 16074yang/xxxx:arm64 .
#amd64架构
docker build -t 16074yang/xxxx:amd64 .
````

`如果开始根据Dockerfile构建的镜像不是按照私服镜像命名，则需要重新打标签`

## 2.推送镜像

```sh
docker push 16074yang/xxxx:arm64|16074yang/xxxx:amd64
```

## 3.创建一个新的 `manifest`，指定多架构镜像的名称，和具体的不同架构的镜像名称

```sh
docker manifest create --insecure 镜像名:版本号 16074yang/xxxx:arm64 16074yang/xxxx:amd64
```

远程仓库里面也必须要有这两个镜像，否则下面创建 `manifest`时，会提示：`no such manifest: `

## 4.声明不同架构镜像对应的操作系统和cpu架构类型，其中x86_64需要用amd64来指定

````sh
docker manifest annotate 镜像名:版本号 16074yang/xxxx:arm64 --os linux --arch arm64 
docker manifest annotate 镜像名:版本号 16074yang/xxxx:amd64 --os linux --arch amd64
````

## 5.将manifest推送到私用仓库中

```
docker manifest push --insecure 16074yang/xxl-job-admin:v2.3.0
```

## 6.使用

一般情况下，操作系统可以自动识别出不同镜像的架构镜像，如果识别不出来，补充hash值确定镜像，再进行拉取

````
docker pull 镜像名@sha256:d7efd06fc86af64b0215e44b31ad4e77e8926d921a31e71393aacd691ea71154
````

