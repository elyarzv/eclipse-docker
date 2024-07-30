# Path to the VcXsrv executable
$vcxsrvPath = "C:\Program Files\VcXsrv\xlaunch.exe"

# Path to the VcXsrv configuration file
$configFilePath = "C:\temp\config.xlaunch"

# Start VcXsrv with the configuration file
Start-Process -FilePath $configFilePath

# Set the DISPLAY environment variable
$env:DISPLAY="host.docker.internal:0.0"

# Define the folder path
$folderPath = "U:\eclipse-workspace"



# Run the Docker command
docker pull ezavvari/eclipse-docker:latest
docker run --name docker-container -ti --rm -e DISPLAY=$env:DISPLAY --user 1000:1000 -v /tmp/.X11-unix:/tmp/.X11-unix -v "${PWD}/eclipse-workspace:/home/ubuntu/eclipse-workspace:rw" ezavvari/eclipse-docker:latest /usr/local/bin/eclipse -data /home/ubuntu/eclipse-workspace
