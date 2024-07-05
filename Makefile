# Makefile for Docker automation

# Variables
IMAGE_NAME=ezavvari/eclipse-docker:latest
CONTAINER_NAME=eclipse-container
DOCKERFILE_PATH=.
PORT=8080

.PHONY: all docker-build docker-run docker-stop docker-remove

# Default target
all: docker-build

docker-login:
	docker login

# Build Docker image
docker-build:
	docker build -t $(IMAGE_NAME) $(DOCKERFILE_PATH)

docker-push:
	docker push $(IMAGE_NAME)

# Run Docker container
docker-run:
	@echo "Running Docker container..."
	ipad=$$(ip addr show en0 | grep "inet\b" | awk '{print $$2}' | cut -d/ -f1)
	xhost + "$$ipad"; \
	export DISPLAY="$$ipad:0"; \
	docker run -ti --rm -e DISPLAY=$$DISPLAY \
		--name $(CONTAINER_NAME) \
		-v /tmp/.X11-unix:/tmp/.X11-unix -v \
		"$$(pwd)":/home/developer/eclipse-workspace \
		$(IMAGE_NAME) /usr/local/bin/eclipse -data /home/developer/eclipse-workspace

# Clean up dangling images
docker-clean:
	docker image prune -f