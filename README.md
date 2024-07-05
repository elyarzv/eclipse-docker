# Eclipse Docker Container

This repository provides a Dockerfile and necessary instructions to run Eclipse IDE in a Docker container.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Docker](https://docs.docker.com/get-docker/) on your machine.
- You have an internet connection to pull the Docker image and download dependencies.

## Setup

1. Clone this repository to your local machine:

    ```sh
    git clone https://github.com/yourusername/eclipse-docker.git
    cd eclipse-docker
    ```

2. Ensure the Dockerfile, Makefile, and other necessary files (like `packages.txt` if you are installing additional packages) are in the cloned directory.

## Building the Docker Image

To build the Docker image for Eclipse, you can use the provided Makefile:

```sh
make docker-build
