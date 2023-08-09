# nginx安装

## 1.安装地址,选择适合自己的版本

```
http://nginx.org/en/download.html
```

## 2.解压编译

```
tar -zxvf nginx-1.18.0.tar.gz
```

```
./configure
```

```
make&make install
```

## 3.报错

3.1./configure: error: the HTTP rewrite module requires the PCRE library.
You can either disable the module by using --without-http_rewrite_module
option, or install the PCRE library into the system, or build the PCRE library
statically from the source with nginx by using --with-pcre= option.

输入指令:

````
sudo apt-get update

sudo apt-get install libpcre3 libpcre3-dev

````

3.2./configure: error: the HTTP gzip module requires the zlib library.
You can either disable the module by using --without-http_gzip_module
option, or install the zlib library into the system, or build the zlib library
statically from the source with nginx by using --with-zlib= option.

输入指令

```
sudo apt-get install zlib1g-dev
```

