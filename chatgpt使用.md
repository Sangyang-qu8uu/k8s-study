# chatgpt使用

## 1.注册chatgpt账号

由于我们国家不支持。所以需要其他国家号码激活 [获取虚拟手机号码。短期手机号码。手机短信激活服务 (sms-activate.org)](https://sms-activate.org/getNumber) ，大概费用15卢布不等,约等于1块钱左右

建议使用邮箱为outlook邮箱，不要使用qq或者网易邮箱，否则可能被封的风险



## 2.最好是能够魔法上网，不能魔法上网可以使用github[开源项目](https://github.com/pengzhile/pandora) pandora 

## 3安装部署

```sh
docker pull pengzhile/pandora 

docker run  -e PANDORA_CLOUD=cloud -e PANDORA_SERVER=0.0.0.0:8899 -p 8899:8899 -d pengzhile/pandora 
```

本地访问：http://localhost:8899

windows安装docker Desktop使用此命令可能报错

![](pic\Docker Desktop.png)

执行一下

```sh
wsl --update
```

## 4.nginx代理

```
后期补充....
```

## 5.最后可以愉快的使用了

![](pic\chatgpt使用.png)