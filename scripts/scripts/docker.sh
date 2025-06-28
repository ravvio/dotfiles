#/usr/bin/env bash

case "$1" in
    "start")
        sudo systemctl start docker
        sudo systemctl start buildkit
        echo "Docker Started"
        ;;
    "stop")
        sudo systemctl stop docker.socket
        sudo systemctl stop docker
        sudo systemctl stop buildkit.socket
        sudo systemctl stop buildkit
        echo "Docker Stopped"
        ;;
    *)
        echo "Option not provided: start / stop"
esac
