Centos安装Harbor

1.环境准备

Docker:26.1.4

Docker-compose:v2.25.0

ssl自签证书：

2.下载离线包 `harbor-offline-installer-v2.10.1.tgz` 并且解压

官网地址： https://github.com/goharbor/harbor/releases

```sh
tar -zxvf harbor-offline-installer-v2.10.1.tgz
```

3.修改配制文件 `hostname`  和 `自签证书` 

```
cp harbor.yml.tmpl harbor.yml 

hostname: 主机ip


# https related config
https:
  # https port for harbor, default is 443
  port: 443
  # The path of cert and key files for nginx
  certificate: /data/ssl/public.crt
  private_key: /data/ssl/private.key


```



>
>
>默认用户名密码：admin/Harbor12345

4.相关指令

```sh
./install.sh   (第一次)

之后就可以使用docker-compose启停
docker-compose up -d |down | restart
```

