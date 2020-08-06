#!/bin/bash

printf 'Building default images\n'
printf 'Build clear Alpine image\n'
docker build -t nerevarishe/alpine:latest -f ./alpine-default-images/Dockerfile-clear-alpine-image .
printf '\n\n\n'
printf 'Build clear python alpine image\n'
docker build -t nerevarishe/python-alpine:latest -f ./alpine-default-images/Dockerfile-python-alpine-image .
printf '\n\n\n'
printf 'Build clear node alpine image\n'
docker build -t nerevarishe/node-alpine:latest -f ./alpine-default-images/Dockerfile-node-alpine-image .
printf '\n\n\n'
printf 'Build clear nginx alpine image\n'
docker build -t nerevarishe/nginx-alpine:latest -f ./alpine-default-images/Dockerfile-nginx-alpine-image .
printf '\n\n\n'
# Build DB
printf 'Create MongoDB default image\n'
docker build -t nerevarishe/mongo:latest -f ./DB-default-images/Dockerfile-mongo-default-image .
printf '\n\n\n'

printf 'Building dependencies images\n'
printf 'Build python image with dependencies\n'
docker build -t nerevarishe/saas-crm-dashboard-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf '\n\n\n'
printf 'Build node image with dependencies\n'
docker build -t nerevarishe/saas-crm-dashboard-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf '\n\n\n'


printf 'Building web app\n'
# Build backend
printf 'Build backend image\n'
docker build -t nerevarishe/saas-crm-dashboard-backend -f ./web-app-images/Dockerfile-backend .
# Build frontend
printf 'Building frontend image\n'
docker build -t nerevarishe/saas-crm-dashboard-node-build:latest -f ./web-app-images/Dockerfile-frontend-build .
docker build -t nerevarishe/saas-crm-dashboard-frontend -f ./web-app-images/Dockerfile-frontend .
printf '\n\n\n'
# Build cron

#printf 'Srtarting app\n'
# docker-compose up -d
#printf '\n\n\n'
#docker-compose ps
