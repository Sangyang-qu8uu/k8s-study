#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="openresty_container"
export CPUS="1.0"
export MEMORY_LIMIT="512m"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
}

start() {
    print_env
    echo "Starting OpenResty container..."
    docker-compose up -d
}

stop() {
    echo "Stopping OpenResty container..."
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
