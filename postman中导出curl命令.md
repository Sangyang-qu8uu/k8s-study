# postman中导出curl命令

## 1.windows安装curl而且配置环境变量

https://curl.haxx.se/windows/

![curl下载地址.png](pic\curl下载地址.png)

## 2.环境变量

![curl_home.png](pic\curl_home.png)

## 3.postman导出curl

![curl.png](pic\curl.png)

命令:

```sh
curl --location 'https://www.baidu.com/sugrec?null=null&prod=pc_his&from=pc_web&json=1&sid=38516_36561_38686_38674_38610_38767_38581_38485_38816_38822_38752_38765_26350_38567&hisdata=&_t=1685946175220&req=2&csor=0'
```

## 4.实测Linux不会报错，但是windows会报错

解决方案，先执行这个，再执行上面的命令

```sh
Remove-item alias:curl
```

```sh
{
    "err_no": 0,
    "errmsg": "",
    "queryid": "0x13a8bc005593512"
}
```





