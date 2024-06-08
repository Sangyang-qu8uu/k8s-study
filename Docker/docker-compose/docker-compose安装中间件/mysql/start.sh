#!/bin/bash

# 设置环境变量
export CONTAINER_NAME=my_mysql_container
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_DB_ROOT_PASSWORD="root"
export PANEL_APP_PORT_HTTP=3306

# 创建和写入 ./conf/my.cnf 文件内容
create_config_file() {
    if [ ! -f ./conf/my.cnf ]; then
        echo "Creating my.cnf configuration file..."
        mkdir -p ./conf
        cat > ./conf/my.cnf <<EOL
[mysqld]
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql
log_error_suppression_list='MY-013360'

character_set_server=utf8
lower_case_table_names=1
group_concat_max_len=1024000
log_bin_trust_function_creators=1

pid-file=/var/run/mysqld/mysqld.pid

[client]
socket=/var/run/mysqld/mysqld.sock

!includedir /etc/mysql/conf.d/
EOL
    else
        echo "my.cnf configuration file already exists. Skipping creation."
    fi
}

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "MySQL Root Password: $PANEL_DB_ROOT_PASSWORD"
    echo "Host IP: $HOST_IP"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
}

start() {
    create_config_file
    print_env
    echo "Starting MySQL container..."
    docker-compose up -d
}

stop() {
    echo "Stopping MySQL container..."
    docker-compose down
}

restart() {
    stop
    start
}

status() {
    docker-compose ps
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
