#!/bin/bash

# 设置环境变量
export CONTAINER_NAME="my_neo4j_container"
export CPUS="1.0"
export MEMORY_LIMIT="2G"
export PANEL_APP_PORT_HTTP=7474
export PANEL_APP_PORT_BOLT=7687
export HOST_IP="0.0.0.0"

# 打印环境变量
print_env() {
    echo "Container Name: $CONTAINER_NAME"
    echo "CPU Limit: $CPUS"
    echo "Memory Limit: $MEMORY_LIMIT"
    echo "HTTP Port: $PANEL_APP_PORT_HTTP"
    echo "Bolt Port: $PANEL_APP_PORT_BOLT"
    echo "Host IP: $HOST_IP"
}

start() {
    print_env
    echo "Starting Neo4j container..."
    docker-compose up -d
}

stop() {
    echo "Stopping Neo4j container..."
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
