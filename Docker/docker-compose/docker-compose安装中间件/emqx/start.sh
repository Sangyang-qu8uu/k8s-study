#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_emqx_container"
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_APP_PORT_HTTP=18083
export EMQX_PORT_1883=1883
export EMQX_PORT_8083=8083
export EMQX_PORT_8084=8084
export EMQX_PORT_8883=8883

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
    echo "EMQX Port 1883: $EMQX_PORT_1883"
    echo "EMQX Port 8083: $EMQX_PORT_8083"
    echo "EMQX Port 8084: $EMQX_PORT_8084"
    echo "EMQX Port 8883: $EMQX_PORT_8883"
}

start() {
    print_env
    echo "Starting EMQX container..."
    docker-compose up -d
}

stop() {
    echo "Stopping EMQX container..."
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
