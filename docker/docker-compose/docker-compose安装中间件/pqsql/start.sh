#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_postgresql_container"
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_DB_ROOT_USER="postgres"
export PANEL_DB_ROOT_PASSWORD="postgres"
export PANEL_APP_PORT_HTTP=5432
export HOST_IP="0.0.0.0"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "PostgreSQL Root User: $PANEL_DB_ROOT_USER"
    echo "PostgreSQL Root Password: $PANEL_DB_ROOT_PASSWORD"
    echo "Host IP: $HOST_IP"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
}

start() {
    print_env
    echo "Starting PostgreSQL container..."
    docker-compose up -d
}

stop() {
    echo "Stopping PostgreSQL container..."
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
