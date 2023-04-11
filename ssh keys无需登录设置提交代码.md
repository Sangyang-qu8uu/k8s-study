# ssh keys无需登录设置提交代码

1.生成ssh-key

```
ssh-keygen -t rsa -C "your_email.com"
```

2.设置github中ssh认证SSH keys,粘贴id_rsa.pub

```
下次使用git clone "ssh地址"
```

3.下面是git的常规操作了

```
#--------------------------Git提交代码--------------------------

#进入项目文件夹，初始化一个Git仓库
git init 
#加入当前目录下所有文件放入临时状态/暂存区(Staging)，可以使用如下命令
git add .
#查看仓库当前文件提交状态（A：提交成功；AM：文件在添加到缓存之后又有改动）
git status -s
#从Git的暂存区提交版本到仓库，参数-m后为当次提交的备注信息
git commit -m "项目初始化"
#将本地的Git仓库信息推送上传到服务器
git push git@github.com:yn197/k8s-study.git
#查看git提交的日志
git log
```



参考地址：

https://gitee.com/help/articles/4114#article-header0