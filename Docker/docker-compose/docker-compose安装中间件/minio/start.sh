#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_minio_container"
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_APP_PORT_HTTP=9001
export PANEL_APP_PORT_API=9000
export MINIO_BROWSER="on"
export MINIO_BROWSER_LOGIN_ANIMATION="on"
export MINIO_BROWSER_SESSION_DURATION="1h"
export PANEL_MINIO_ROOT_PASSWORD="minioadmin"
export PANEL_MINIO_ROOT_USER="minioadmin"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
    echo "API Port: $PANEL_APP_PORT_API"
    echo "MinIO Browser: $MINIO_BROWSER"
    echo "MinIO Browser Login Animation: $MINIO_BROWSER_LOGIN_ANIMATION"
    echo "MinIO Browser Session Duration: $MINIO_BROWSER_SESSION_DURATION"
    echo "MinIO Root Password: $PANEL_MINIO_ROOT_PASSWORD"
    echo "MinIO Root User: $PANEL_MINIO_ROOT_USER"
}

start() {
    print_env
    echo "Starting MinIO container..."
    docker-compose up -d
}

stop() {
    echo "Stopping MinIO container..."
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
