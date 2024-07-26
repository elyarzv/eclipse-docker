# Eclipse Docker Container

This repository provides a Dockerfile and necessary instructions to run Eclipse IDE in a Docker container.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Docker](https://docs.docker.com/get-docker/) on your machine.
- You have an internet connection to pull the Docker image and download dependencies.
- If you are using Windows or macOS make sure you have an X server installed (e.g., XQuartz on macOS, VcXsrv on Windows).
---
## Running Eclipse Docker Container

- ### Ubuntu
1. Clone the repository:
    ```sh
    git clone https://github.com/elyarzv/eclipse-docker.git
    cd eclipse-docker
    ```
2. Login to Docker:
    ```sh
    make docker-login
    ```
3. Run the container:
    ```sh
    make docker-run
    ```
    

- ### Windows
1. Clone the [repository zip file](https://github.com/elyarzv/eclipse-docker/archive/refs/heads/main.zip) and extract it.
2. Ensure the Docker is running.
3. Ensure X Server is running.
4. Run the `run-docker.exe` file in the [`Windows`](https://github.com/elyarzv/eclipse-docker/tree/main/windows) folder.
    * The `EclipseDocker.exe` file can be copied anywhere on your hard drive
    * Running `EclipseDocker.exe` file will create an `eclipse-workspace` folder in the directory where `EclipseDocker.exe` file is placed.
    * The created `ecipse-workspace` is a shared folder between your machine and the Docker container. 
    * The location of the `eclipse-workspace` folder in the Docker container will be `/home/developer/eclipse-workspace`.

- ### MacOS
1. Clone the [repository zip file](https://github.com/elyarzv/eclipse-docker/archive/refs/heads/main.zip) and extract it.
2. Ensure the Docker is running.
3. Ensure X Server is running.
4. Run the `EclipseDocker.command` file in the [`Mac`](https://github.com/elyarzv/eclipse-docker/tree/main/Mac) folder.
    * The `EclipseDocker.command` file can be copied anywhere on your hard drive
    * Running `EclipseDocker.command` file will create an `eclipse-workspace` folder in the directory where `EclipseDocker.command` file is placed.
    * The created `ecipse-workspace` is a shared folder between your machine and the Docker container. 
    * The location of the `eclipse-workspace` folder in the Docker container will be `/home/developer/eclipse-workspace`.

---
## Development in Ubuntu
Clone the repository to your local machine:
```sh
git clone https://github.com/elyarzv/eclipse-docker.git
cd eclipse-docker
```
New apt packages should be added to `packages.txt` file. Any changes could be made to `dockerfile` and following make commands could be used to:
- Login to Docker:
    ```sh
    make docker-login
    ```
- Pull the image from Docker Hub:
    ```sh
    make docker-pull
    ```
- Build the image
    ```sh
    make docker-build
    ```
- Push the Docker image to the Docker Hub:
    ```sh
    make docker-push
    ```
- Run the Docker container:
    ```sh
    make docker-run
    ```
- Clean up dangling Docker images:
    ```sh
    make docker-clean
    ```

---

## Troubleshooting

##### Any Error related to the `X server` or `Display`

- If you are using Windows or macOS, make sure you have an X server installed (e.g., XQuartz on macOS, Xming on Windows).
- If the X Server is installed and running, but still getting error related to display, in X Server privacy settings enable allowing connects from network clients.

##### Error: `docker: Error response from daemon: Conflict. The container name "/eclipse-container" is already in use.`

- If the container name is already in use, you can remove the existing container with:

    ```sh
    docker rm -f eclipse-container
    ```

- Then, re-run the docker run command or, on Windows and macOS, run the EclipseDocker.exe or EclipseDocker.command files again.


## Contact

If you have any questions or need further assistance, please contact [elyar_zavvari@sfu.com](mailto:elyar_zavvari@sfu.com).