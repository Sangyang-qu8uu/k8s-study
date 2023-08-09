# ssh keys无需登录设置提交代码

## 1.生成ssh-key

```
ssh-keygen -t rsa -C "your_email.com"
```

## 2.设置github中ssh认证SSH keys,粘贴id_rsa.pub

```
下次使用git clone "ssh地址"
```

## 3.下面是git的常规操作了

### 3.1进入项目文件夹，初始化一个Git仓库

```
git init 
```

### 3.2加入当前目录下所有文件放入临时状态/暂存区(Staging)，可以使用如下命令

```
git add .
```

### 3.3查看仓库当前文件提交状态（A：提交成功；AM：文件在添加到缓存之后又有改动）

```
git status -s
```

### 3.4从Git的暂存区提交版本到仓库，参数-m后为当次提交的备注信息

```
git commit -m "项目初始化"
```

### 3.5将本地的Git仓库信息推送上传到服务器

```
git push git@github.com:yn197/k8s-study.git
```

### 3.6查看git提交的日志

```
git log
```

## 4.GIt提交大文件

### 4.1 下载git-lfs-windows-v3.3.0    https://git-lfs.github.com/

### 4.2 在本地安装这个软件

### 4.3执行命令

```
#lfs初始化
git lfs install
#我这边以上传一个minio.exe的文件为例
git lfs track "*.exe"
```



### 4.4添加.gitattributes（配置文件，缺少它执行其他git操作可能会有问题，具体作用不详述） 

```
git add .gitattributes
```

4.5添加要上传（push）的文件 

```sh
git add *.exe
```



参考地址：

https://gitee.com/help/articles/4114#article-header0

[如何在GitHub上传大文件（≥100M）_github大文件_weixin_45405814的博客-CSDN博客](https://blog.csdn.net/weixin_45405814/article/details/107080156) 