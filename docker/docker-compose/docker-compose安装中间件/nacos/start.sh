#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_nacos_container"
export CPUS="1.0"
export MEMORY_LIMIT="512M"
export PANEL_APP_PORT_HTTP=8848
export PANEL_APP_PORT_COMMUNICATION=9848
export NACOS_AUTH_ENABLE="FALSE"
export JVM_XMS="256m"
export JVM_XMX="512m"
export JVM_XMN="256m"
export JVM_MS="128m"
export JVM_MMS="256m"
export NACOS_AUTH_IDENTITY_KEY="nacos"
export NACOS_AUTH_IDENTITY_VALUE="nacos"
export NACOS_AUTH_TOKEN="nacos"
export NACOS_SERVER_IP="127.0.0.1"
export HOST_IP="0.0.0.0"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
    echo "Communication Port: $PANEL_APP_PORT_COMMUNICATION"
    echo "NACOS Auth Enable: $NACOS_AUTH_ENABLE"
    echo "JVM XMS: $JVM_XMS"
    echo "JVM XMX: $JVM_XMX"
    echo "JVM XMN: $JVM_XMN"
    echo "JVM MS: $JVM_MS"
    echo "JVM MMS: $JVM_MMS"
    echo "NACOS Auth Identity Key: $NACOS_AUTH_IDENTITY_KEY"
    echo "NACOS Auth Identity Value: $NACOS_AUTH_IDENTITY_VALUE"
    echo "NACOS Auth Token: $NACOS_AUTH_TOKEN"
    echo "NACOS Server IP: $NACOS_SERVER_IP"
    echo "Host IP: $HOST_IP"
}

start() {
    print_env
    echo "Starting Nacos container..."
    docker-compose up -d
}

stop() {
    echo "Stopping Nacos container..."
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
