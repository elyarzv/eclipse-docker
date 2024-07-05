# Eclipse Docker Container

This repository provides a Dockerfile and necessary instructions to run Eclipse IDE in a Docker container.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Docker](https://docs.docker.com/get-docker/) on your machine.
- You have an internet connection to pull the Docker image and download dependencies.

## Setup

1. Clone this repository to your local machine:

    ```sh
    git clone https://github.com/elyarzv/eclipse-docker.git
    cd eclipse-docker
    ```

2. Ensure the Dockerfile, Makefile, and other necessary files (like `packages.txt` if you are installing additional packages) are in the cloned directory.

## Building the Docker Image

To build the Docker image for Eclipse, you can use the provided Makefile:


make docker-build

This command will create a Docker image named `eclipse-docker` with the tag `latest`.

## Running the Docker Container

To run the Docker container with Eclipse, follow these steps:

1. **Create and run a new Docker container using the Makefile:**

    ```sh
    make docker-run
    ```

    This command will:
    - Create a container named `eclipse-container`.
    - Set up the necessary environment variables and volume mounts to enable GUI applications.

2. Once the container is running, Eclipse should start, and you can use it as you normally would on your host machine.

## Makefile Commands

The Makefile includes the following commands:

- **Build the Docker image:**

    ```sh
    make docker-build
    ```

- **Run the Docker container:**

    ```sh
    make docker-run
    ```

- **Stop the Docker container:**

    ```sh
    make docker-stop
    ```

- **Remove the Docker container:**

    ```sh
    make docker-remove
    ```

- **Clean up dangling Docker images:**

    ```sh
    make docker-clean
    ```

- **Clean up all unused Docker images:**

    ```sh
    make docker-clean-all
    ```

## Troubleshooting

### Error: `cannot connect to X server`

- Ensure you have X11 forwarding enabled on your host machine.
- If you are using Windows or macOS, make sure you have an X server installed (e.g., XQuartz on macOS, Xming on Windows).

### Error: `docker: Error response from daemon: Conflict. The container name "/eclipse-container" is already in use.`

- If the container name is already in use, you can remove the existing container with:

    ```sh
    docker rm -f eclipse-container
    ```

- Then, re-run the `docker run` command.


## Contact

If you have any questions or need further assistance, please contact [elyar_zavvari@sfu.com](mailto:elyar_zavvari@sfu.com).

