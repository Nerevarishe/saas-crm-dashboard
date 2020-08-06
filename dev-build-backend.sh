#!/bin/bash

# Build backend
printf '\e[1;32m%-6s\e[m\n' "Build backend image"
docker build -t nerevarishe/saas-crm-dashboard-backend -f ./web-app-images/Dockerfile-backend .
printf "\n\n\n"
printf '\e[1;32m%-6s\e[m\n' "Srtarting app"
docker-compose up