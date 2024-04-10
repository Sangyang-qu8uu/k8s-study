library initialization failed - unable to allocate file descriptor table - out of memory

起因是使用docker-compsoe搭建的zk+kafka报错，之前正常使用突然异常了

解决方案

排查: 搜索一下，发现是 ulimit 参数问题在 */etc/systemd/system/* 或者 */usr/lib/systemd/system/*
找到 docker.service 文件，在 ExecStart=/usr/bin/dockerd 后面添加 --default-ulimit nofile=65536:65536 参数

重启 docker 生效

> systemctl daemon-reload
>
> systemctl restart docker

