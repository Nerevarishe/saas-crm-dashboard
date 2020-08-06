#!/bin/bash

# Build frontend
printf '\e[1;32m%-6s\e[m\n' "Building frontend image"
docker build -t nerevarishe/saas-crm-dashboard-node-build:latest -f ./web-app-images/Dockerfile-frontend-build .
docker build -t nerevarishe/saas-crm-dashboard-frontend:latest -f ./web-app-images/Dockerfile-frontend .
printf "\n\n\n"
# Build cron

printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up