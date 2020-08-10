#!/bin/bash

# Export all variables from .env
source .env

# Build backend
printf '\e[1;32m%-6s\e[m\n' "Building dependencies images"
printf '\e[1;32m%-6s\e[m\n' "Build python image with dependencies"
docker build -t $DOCKER_IMAGE_PREFIX-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf "\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build backend image"
docker build -t $DOCKER_IMAGE_PREFIX-backend:latest -f ./web-app-images/Dockerfile-backend .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up