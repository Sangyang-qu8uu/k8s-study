Docker-compose部署中间件

1.目录

docker-compose/
├── doc
├── docker-compose安装中间件
│   ├── emqx
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── kafka
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── minio
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── mongodb
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── mysql
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── nacos
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── neo4j
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── pqsql
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── redis
│   │   ├── docker-compose.yml
│   │   └── start.sh
│   ├── rockmq
│   ├── xxljob
│   │   ├── docker-compose.yml
│   │   └── xxljob.sql
│   └── Docker-compose使用指南.md
├── docker-compose报错.md
└── Ubuntu安装Docker-compose.md

2.版本

| 名字          | 版本                                     | 架构 |      |
| ------------- | ---------------------------------------- | ---- | ---- |
| emqx          | emqx/emqx:5.7.0                          | x86  |      |
| kafka         | 16074yang/kafka                          | x86  |      |
| kafka-map     | 16074yang/kafka-map                      | x86  |      |
| zookeeper     | 16074yang/zookeeper                      | x86  |      |
| minio         | minio/minio:RELEASE.2024-05-10T01-41-38Z | x86  |      |
| mongo         | mongo:7.0.11                             | x86  |      |
| mysql         | mysql:8.0.37                             | x86  |      |
| nacos         | nacos-server:v2.3.2                      | x86  |      |
| neo4j         | neo4j:5.20.0                             | x86  |      |
| pqsql         | postgres:16.3-alpine                     | x86  |      |
| redis         | redis:7.2.5                              | x86  |      |
| xxl-job-admin | 16074yang/xxl-job-admin:v2.4.0           | x86  |      |
|               |                                          |      |      |
|               |                                          |      |      |
|               |                                          |      |      |
|               |                                          |      |      |

3.赋权

```
chmod -R 777 start.sh
```

4.运行

```
./start.sh start|stop|restart
```

