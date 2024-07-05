# Set the DISPLAY environment variable
$env:DISPLAY="host.docker.internal:0.0"

# Run Docker container with the specified command
docker run -ti --rm -e DISPLAY="host.docker.internal:0.0" -v /tmp/.X11-unix:/tmp/.X11-unix -v "${PWD}:/home/developer/eclipse-workspace:rw" ezavvari/eclipse-container:latest /usr/local/bin/eclipse -data /home/developer/eclipse-workspace/eclipse-workspace