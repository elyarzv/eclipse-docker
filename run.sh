#!/bin/bash

# Function to run the Docker container with the correct DISPLAY setting
run_docker() {
    echo "Running Docker container with Eclipse..."
    docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/home/developer/eclipse-workspace ezavvari/eclipse-dockers:latest /usr/local/bin/eclipse -data /home/developer/eclipse-workspace
}

# Detect the operating system
OS=$(uname -s)

case "$OS" in
    Linux*)
        echo "Detected Linux"
        ipad=$(ip addr show en0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
        xhost + "$ipad"
        export DISPLAY="$ipad:0"
        run_docker
        ;;
    Darwin*)
        echo "Detected macOS"
        export DISPLAY=host.docker.internal:0
        xhost + 127.0.0.1
        run_docker
        ;;
    MINGW*|CYGWIN*|MSYS*)
        echo "Detected Windows"
        export DISPLAY=host.docker.internal:0
        # No need to run xhost as VcXsrv allows localhost connections by default
        run_docker
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac
