# 安装kubernetes dashboard

## 1执行命令安装

```
kubectl create -f kubernetes-dashboard.yaml
kubectl apply -f service-account.yaml
```

## 2查看secret

```
kubectl get secret -n kubernetes-dashboard
```

![](H:\k8s-study\各个组件学习\dashboard\1.png)

## 3.找到对应的secret，describe一下，查看一下dashboard-admin对应的token

```
kubectl describe secret/dashboard-admin-token-cq2rs -n kubernetes-dashboard
```

![](H:\k8s-study\各个组件学习\dashboard\查看token.png)

理论上这个时候还是不能访问

## 4生成https证书

对于此部分可以直接生成一个https的证书（相对简单），也可以先生成一个ca根证书(虽然复杂一点，但后面很方便)

### 4.1openssl生成ca根证书,生成root-ca的key

```
openssl genrsa -out "root-ca.key" 4096
```

### 4.2通过ca的key生成csr文件

```
openssl req -new -key "root-ca.key" -out "root-ca.csr" -sha256 -subj "/C=CN/ST=SC/L=CD/O=haiyangGroup/CN=haiyangRootCA"
```

### 4.3配置ca证书

```
cat > root-ca.cnf << EOF
[root_ca]
basicConstraints = critical,CA:TRUE,pathlen:1
keyUsage = critical, nonRepudiation, cRLSign, keyCertSign
subjectKeyIdentifier=hash
EOF
```

### 4.4签发根证书

```
openssl x509 -req -days 3650 -in "root-ca.csr" -signkey "root-ca.key" -sha256 -out "root-ca.crt" -extfile "root-ca.cnf" -extensions root_ca
```

### 4.5ca根证书颁发server端证书

```
openssl genrsa -out "dashboard.key" 4096
```

### 4.6使用私钥生成证书请求文件

```
openssl req -new -key "dashboard.key" -out "dashboard.csr" -sha256 -subj "/C=CN/ST=SC/L=CD/O=haiyangGroup/CN=dashboard.k8s.com"
```

### 4.7配置证书，新建 site.cnf 文件

```
cat > site.cnf << EOF
[server]
authorityKeyIdentifier=keyid,issuer
basicConstraints = critical,CA:FALSE
extendedKeyUsage=serverAuth
keyUsage = critical, digitalSignature, keyEncipherment
subjectAltName = DNS:dashboard.k8s.com, IP:192.168.1.123
subjectKeyIdentifier=hash
EOF
```

### 4.8注意：上面的DNS和IP为选填部分，需要填写为server端的域名或ip

签署站点 SSL 证书

```
openssl x509 -req -days 750 -in "dashboard.csr" -sha256 -CA "root-ca.crt" -CAkey "root-ca.key" -CAcreateserial -out "dashboard.crt" -extfile "site.cnf" -extensions server
```

### 4.9替换https证书

```
kubectl delete secret kubernetes-dashboard-certs -n kubernetes-dashboard
```

### 4.10生成新的证书

```
kubectl create secret generic kubernetes-dashboard-certs -n kubernetes-dashboard --from-file=dashboard.crt=./dashboard.crt --from-file=dashboard.key=./dashboard.key


```

### 4.11删除原kubernetes-dashboard，让其自动重启加载新的证书

````
kubectl delete pod kubernetes-dashboard-cb988587b-9ttjk -n kubernetes-dashboard
````

### 4.12-导入ca证书到信任的根证书机构

      从操作的服务器上将root-ca.crt下载下来，导入到需要访问的电脑中，并添加到受信任的颁发机构

## 5获取token登录

```
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')


kubectl -n kube-system describe $(kubectl -n kube-system get secret -n kube-system -o name | grep namespace) | grep token
```

