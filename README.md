# Eclipse Docker Container

This repository provides a Dockerfile and necessary instructions to run Eclipse IDE in a Docker container.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Docker](https://docs.docker.com/get-docker/) on your machine.
- You have an internet connection to pull the Docker image and download dependencies.
- If you are using Windows or macOS make sure you have an X server installed (e.g., XQuartz on macOS, VcXsrv on Windows).

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
2. Make sure the docker is running.
3. Run the `run-docker.exe` file in the [`Windows`](https://github.com/elyarzv/eclipse-docker/tree/main/windows) folder.
- ### macOS
    to be completed
## Development in Ubuntu
Clone the repository to your local machine:
```sh
git clone https://github.com/elyarzv/eclipse-docker.git
cd eclipse-docker
```
New apt packages should be added to `packages.txt` file. Any changes could be made to `dockerfile` and following make commands could be used to:
- Login to docker:
    ```sh
    make docker-login
    ```
- Pull the image from docker hub:
    ```sh
    make doker-pull
    ```
- Build the image
    ```sh
    make docker-build
    ```
- Push the docker image to the docker hub:
    ```sh
    make docker-push
    ```
- Run the docker container:
    ```sh
    make docker-run
    ```
- Clean up dangling docker images:
    ```sh
    make docker-clean
    ```

## Troubleshooting

##### Error: `cannot connect to X server`

- Ensure you have X11 forwarding enabled on your host machine.
- If you are using Windows or macOS, make sure you have an X server installed (e.g., XQuartz on macOS, Xming on Windows).

##### Error: `docker: Error response from daemon: Conflict. The container name "/eclipse-container" is already in use.`

- If the container name is already in use, you can remove the existing container with:

    ```sh
    docker rm -f eclipse-container
    ```

- Then, re-run the `docker run` command.


## Contact

If you have any questions or need further assistance, please contact [elyar_zavvari@sfu.com](mailto:elyar_zavvari@sfu.com).

VAriables to be aded:

BOOST_INCLUDE=/usr/include
BOOST_POSTFIX=
BOOST_DEBUG_POSTFIX=
BOOST_LIB=/usr/lib/x86_64-linux-gnu

/etc/environment
