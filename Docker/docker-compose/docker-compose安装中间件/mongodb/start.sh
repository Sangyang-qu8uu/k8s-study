#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_mongodb_container"
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_DB_ROOT_PASSWORD="netmarch"
export PANEL_DB_ROOT_USER="root"
export PANEL_APP_PORT_HTTP=27017
export HOST_IP="0.0.0.0"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "MongoDB Root User: $PANEL_DB_ROOT_USER"
    echo "MongoDB Root Password: $PANEL_DB_ROOT_PASSWORD"
    echo "Host IP: $HOST_IP"
    echo "MongoDB Port: $PANEL_APP_PORT_HTTP"
}

start() {
    print_env
    echo "Starting MongoDB container..."
    docker-compose up -d
}

stop() {
    echo "Stopping MongoDB container..."
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
