kubesphere使用https访问

1.ubuntu安装nignx

2.设置默认的nginx配置

```
#以下属性中，以ssl开头的属性表示与证书配置有关。
server {
    listen 443 ssl;
    #配置HTTPS的默认访问端口为443。
    #如果未在此处配置HTTPS的默认访问端口，可能会造成Nginx无法启动。
    #如果您使用Nginx 1.15.0及以上版本，请使用listen 443 ssl代替listen 443和ssl on。
    server_name k8s.test.com;
    root html;
    index index.html index.htm;
    
    ssl_certificate /etc/public.crt;  
    ssl_certificate_key /etc/private.key; 
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    #表示使用的加密套件的类型。
    ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3; #表示使用的TLS协议的类型，您需要自行评估是否配置TLSv1.1协议。
    ssl_prefer_server_ciphers on;
    
    location / {
	  root   html;
	  index  index.html index.htm;
        proxy_pass http://192.168.1.168:30880;
    }
}
```

3.生成key和crt

```
创建一个以openssl.conf以下内容命名的文件。设置IP.1和/或DNS.1指向正确的 IP/DNS 地址：
获取DNS指令：在显示的最下面
cat /etc/resolv.conf
编辑配置文件
vi openssl.conf

配置文件内容： C：国家，CN：域名，注意配置    IP.1 = nginx本机IP     DNS.1 = nginx本机DNS
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
C = CN
ST = Suzhou
L = Kunshan
O = MyOrg
OU = MyOU
CN = MyServerName

[v3_req]
subjectAltName = @alt_names

[alt_names]
IP.1 = 192.168.1.11
DNS.1 = 127.0.0.53
通过指定配置文件运行openssl并在出现提示时输入密码：
openssl req -new -x509 -nodes -days 730 -keyout private.key -out public.crt -config openssl.conf
```

4.重启nginx

````
service nginx restart
````

5.windows页面设置host解析