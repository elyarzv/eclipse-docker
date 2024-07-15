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

# Define paths
$userName = $env:USERNAME
$sourcePath = "U:\eclipse-workspace"
$destinationPath = "C:\Users\$userName\Desktop\temp-eclipse-workspace"

# Step 1: Create U:/eclipse-workspace and C:\Users\$userName\Desktop\eclipse-workspace if it doesn't exist
if (-Not (Test-Path -Path "U:\eclipse-workspace")) {
    New-Item -Path "U:\eclipse-workspace" -ItemType Directory
    Write-Output "Created folder: $sourcePath"
} else {
    Write-Output "Folder already exists: U:\eclipse-workspace"
}

if (-Not (Test-Path -Path "C:\Users\$userName\Desktop\temp-eclipse-workspace")) {
    New-Item -Path "C:\Users\$userName\Desktop\temp-eclipse-workspace" -ItemType Directory
    Write-Output "Created folder: $sourcePath"
} else {
    Write-Output "Folder already exists: C:\Users\$userName\Desktop\temp-eclipse-workspace"
}

# Step 2: Delete C:/Users/$username/Desktop/eclipse-workspace\*
Remove-Item -Path "C:\Users\$userName\Desktop\temp-eclipse-workspace\*" -Recurse -Force

# Step 3: Copy contents from U:/eclipse-workspace to C:/Users/$username/Desktop/eclipse-workspace
Copy-Item -Path "U:eclipse-workspace\*" -Destination "C:\Users\$userName\Desktop\temp-eclipse-workspace\" -Recurse
Write-Output "Copied contents from $sourcePath to $destinationPath"

# Run the Docker command
docker pull ezavvari/eclipse-docker:latest
docker run --name docker-container -ti --rm -e DISPLAY=$env:DISPLAY --user 1000:1000 -v /tmp/.X11-unix:/tmp/.X11-unix -v "${PWD}:/home/xubuntu/eclipse-workspace:rw" ezavvari/eclipse-docker:latest /usr/local/bin/eclipse -data /home/xubuntu/eclipse-workspace/eclipse-workspace

# Step 5: Delete U:/eclipse-workspace
Remove-Item -Path "U:\eclipse-workspace\*" -Recurse -Force
Write-Output "Deleted folder: $sourcePath"

# Step 6: Copy contents from C:/Users/$username/Desktop/eclipse-workspace back to U:/eclipse-workspace
Copy-Item -Path "C:\Users\$userName\Desktop\temp-eclipse-workspace\*" -Destination "U:\eclipse-workspace\" -Recurse
Write-Output "Copied contents back from $destinationPath to $sourcePath"

# Step 7: Delete Delete C:/Users/$username/Desktop/eclipse-workspace\
Remove-Item -Path "C:\Users\$userName\Desktop\temp-eclipse-workspace" -Recurse -Force