# Path to the VcXsrv executable
$vcxsrvPath = "C:\Program Files\VcXsrv\xlaunch.exe"

# Path to the VcXsrv configuration file
$configFilePath = "C:\Users\eza14\Documents\config.xlaunch"

# Start VcXsrv with the configuration file
Start-Process -FilePath $configFilePath

# Set the DISPLAY environment variable
$env:DISPLAY="host.docker.internal:0.0"

# Run the Docker command
docker pull ezavvari/eclipse-docker:latest
docker run --name docker-container -ti --rm -e DISPLAY=$env:DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "${PWD}"/eclipse-workspace/:/home/developer/eclipse-workspace:rw ezavvari/eclipse-docker:latest /usr/local/bin/eclipse -data /home/developer/eclipse-workspace/