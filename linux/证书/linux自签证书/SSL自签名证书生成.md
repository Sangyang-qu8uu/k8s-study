### SSL自签名证书生成

可以使用OpenSSL工具生成Linux自签证书。以下是一个简单的Bash脚本，可以帮助你生成自签证书。



```
#!/bin/bash

# 检查是否安装了openssl
if ! command -v openssl &> /dev/null
then
    echo "openssl 未安装。请先安装 openssl。"
    exit 1
fi

# 设置默认值
DAYS_VALID=365
KEY_FILE="server.key"
CERT_FILE="server.crt"
CSR_FILE="server.csr"
CONFIG_FILE="openssl.cnf"

# 创建一个临时的 openssl 配置文件
cat > $CONFIG_FILE <<EOL
[ req ]
default_bits        = 2048
default_keyfile     = ${KEY_FILE}
distinguished_name  = req_distinguished_name
req_extensions      = req_ext
prompt              = no

[ req_distinguished_name ]
C                   = CN
ST                  = Beijing
L                   = Beijing
O                   = MyCompany
OU                  = MyDivision
CN                  = mydomain.com
emailAddress        = email@mydomain.com

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1   = mydomain.com
DNS.2   = www.mydomain.com
EOL

# 生成私钥
openssl genrsa -out $KEY_FILE 2048

# 生成证书请求文件
openssl req -new -key $KEY_FILE -out $CSR_FILE -config $CONFIG_FILE

# 生成自签证书
openssl x509 -req -days $DAYS_VALID -in $CSR_FILE -signkey $KEY_FILE -out $CERT_FILE -extensions req_ext -extfile $CONFIG_FILE

# 删除临时配置文件
rm -f $CONFIG_FILE

echo "自签证书生成成功！"
echo "私钥文件: $KEY_FILE"
echo "证书文件: $CERT_FILE"

```

### 使用说明

1. 将上述脚本保存为`generate_self_signed_cert.sh`文件。
2. 在终端中给予脚本执行权限：

```sh
chmod +x generate_self_signed_cert.sh

```

   3.执行脚本

```shell
./generate_self_signed_cert.sh
```

执行上述脚本后，你将在当前目录下得到以下文件：

- `server.key`：私钥文件
- `server.csr`：证书签名请求文件
- `server.crt`：自签名证书文件

你可以根据需要修改脚本中的配置，如国家代码、组织名称、域名等。