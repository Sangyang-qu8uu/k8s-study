gitlab-jh（极狐）安装

1.下载

```
https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/apt/packages.gitlab.com/gitlab/gitlab-ce/ubuntu/pool/focal/main/g/gitlab-ce/
```

2.安装

```shell
dpkg -i gitlab-ce_13.10.0-ce.0_amd64.deb
```

3.修改配置

```shell
vi /etc/gitlab/gitlab.rb

external_url 'http://192.168.1.205:9000'
```

4.重启

```sh
gitlab-ctl reconfigure

gitlab-ctl restart
```

5.默认访问地址会要求你改密码

6.常用命令

```sh
find / -name gitlab | xargs rm -rf # 删除所有包含gitlab文件
sudo gitlab-ctl start # 启动所有 gitlab 组件；
sudo gitlab-ctl stop # 停止所有 gitlab 组件；
sudo gitlab-ctl restart # 重启所有 gitlab 组件；
sudo gitlab-ctl status # 查看服务状态；
```





