#!/bin/bash

# Export all variables from .env
source .env

printf '\e[1;32m%-6s\e[m\n' "Building dependencies images"
printf '\e[1;32m%-6s\e[m\n' "Build node image with dependencies"
docker build -t $DOCKER_IMAGE_PREFIX-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf "\n\n"
printf '\e[1;32m%-6s\e[m\n' "Building frontend image"
docker build -t $DOCKER_IMAGE_PREFIX-node-build:latest -f ./web-app-images/Dockerfile-frontend-build .
docker build -t $DOCKER_IMAGE_PREFIX-frontend:latest -f ./web-app-images/Dockerfile-frontend .
printf "\n\n\n"

printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up