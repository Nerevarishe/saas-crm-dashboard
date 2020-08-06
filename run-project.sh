#!/bin/bash

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
# Build DB
printf '\e[1;32m%-6s\e[m\n' "Create MongoDB default image"
docker build -t nerevarishe/mongo:latest -f ./DB-default-images/Dockerfile-mongo-default-image .
printf "\n\n\n"

printf '\e[1;32m%-6s\e[m\n' "Building dependencies images"
printf '\e[1;32m%-6s\e[m\n' "Build python image with dependencies"
docker build -t nerevarishe/saas-crm-dashboard-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Build node image with dependencies"
docker build -t nerevarishe/saas-crm-dashboard-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf "\n\n\n"


printf '\e[1;32m%-6s\e[m\n' "Building web app"
# Build backend
printf '\e[1;32m%-6s\e[m\n' "Build backend image"
docker build -t nerevarishe/saas-crm-dashboard-backend -f ./web-app-images/Dockerfile-backend .
# Build frontend
printf '\e[1;32m%-6s\e[m\n' "Building frontend image"
docker build -t nerevarishe/saas-crm-dashboard-node-build:latest -f ./web-app-images/Dockerfile-frontend-build .
docker build -t nerevarishe/saas-crm-dashboard-frontend:latest -f ./web-app-images/Dockerfile-frontend .
printf "\n\n\n"
# Build cron

printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up -d
printf "\n\n\n"
docker-compose ps
