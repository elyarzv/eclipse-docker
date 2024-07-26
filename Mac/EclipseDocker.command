#!/bin/bash

# Get the directory of the .command file
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Get the IP address of the en0 interface
ipad=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# Allow the local machine to connect to the X server
/opt/local/bin/xhost + "$ipad"
xhost + "$ipad"

# Set the DISPLAY environment variable
export DISPLAY=$ipad:0

# Run the Docker container with the necessary settings
docker run -ti --rm  \
    -e DISPLAY=$DISPLAY --name eclipse-container \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$SCRIPT_DIR/eclipse-workspace:/home/developer/eclipse-workspace:rw" \
    ezavvari/eclipse-docker:latest /usr/local/bin/eclipse -data /home/developer/eclipse-workspace

# Close the terminal after the Docker container exits
osascript -e 'tell application "Terminal" to close first window' & exit