#!/bin/bash

# 设置环境变量
export HOST_IP="192.168.89.129"

# 打印环境变量
print_env() {
    echo "Zookeeper Container: zookeeper"
    echo "Kafka1 Container: kafka1"
    echo "Kafka2 Container: kafka2"
    echo "Kafka Map Container: kafka-map"
    echo "Host IP: $HOST_IP"
}

start() {
    print_env
    echo "Starting Zookeeper and Kafka cluster..."
    docker-compose up -d
}

stop() {
    echo "Stopping Zookeeper and Kafka cluster..."
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
