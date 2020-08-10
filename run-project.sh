#!/bin/bash

# Export all variables from .env
source .env

printf  '\e[1;32m%-6s\e[m\n' "Building default images"
printf '\e[1;32m%-6s\e[m\n' "Build clear Alpine image"
docker build -t nerevarishe/alpine:latest -f ./alpine-default-images/Dockerfile-clear-alpine-image .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build clear python alpine image"
docker build -t nerevarishe/python-alpine:latest -f ./alpine-default-images/Dockerfile-python-alpine-image .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build clear node alpine image"
docker build -t nerevarishe/node-alpine:latest -f ./alpine-default-images/Dockerfile-node-alpine-image .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build clear nginx alpine image"
docker build -t nerevarishe/nginx-alpine:latest -f ./alpine-default-images/Dockerfile-nginx-alpine-image .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Create MongoDB default image"
docker build -t nerevarishe/mongo:latest -f ./DB-default-images/Dockerfile-mongo-default-image .
printf "\n\n\n"

printf '\e[1;32m%-6s\e[m\n' "Building dependencies images"
printf '\e[1;32m%-6s\e[m\n' "Build python image with dependencies"
docker build -t $DOCKER_IMAGE_PREFIX-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build node image with dependencies"
docker build -t $DOCKER_IMAGE_PREFIX-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf "\n\n\n"


printf '\e[1;32m%-6s\e[m\n' "Building web app"
printf '\e[1;32m%-6s\e[m\n' "Build backend image"
docker build -t $DOCKER_IMAGE_PREFIX-backend:latest -f ./web-app-images/Dockerfile-backend .
printf "\n\n"
printf '\e[1;32m%-6s\e[m\n' "Building frontend image"
docker build -t $DOCKER_IMAGE_PREFIX-node-build:latest -f ./web-app-images/Dockerfile-frontend-build .
docker build -t $DOCKER_IMAGE_PREFIX-frontend:latest -f ./web-app-images/Dockerfile-frontend .
printf "\n\n\n"
# TODO: Build cron
# TODO: Delete env variables added in beginig of script
printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up -d
printf "\n\n\n"
docker-compose ps
