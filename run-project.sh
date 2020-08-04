#!/bin/bash

printf 'Building default images\n'
printf 'Build clear Alpine image\n'
#docker build -t nerevarishe/alpine:latest -f ./alpine-default-images/Dockerfile-clear-alpine-image .
printf '\n\n\n'
printf 'Build clear python alpine image\n'
#docker build -t nerevarishe/python-alpine:latest -f ./alpine-default-images/Dockerfile-python-alpine-image .
printf '\n\n\n'
printf 'Build clear node alpine image\n'
#docker build -t nerevarishe/node-alpine:latest -f ./alpine-default-images/Dockerfile-node-alpine-image .
printf '\n\n\n'
printf 'Build clear nginx alpine image\n'
#docker build -t nerevarishe/nginx-alpine:latest -f ./alpine-default-images/Dockerfile-nginx-alpine-image .
printf '\n\n\n'
# Build DB
printf 'Create MongoDB default image\n'
#docker build -t nerevarishe/mongo:latest -f ./Dockerfile-mongo-default-image .
printf '\n\n\n'

printf 'Building dependencies images\n'
printf 'Build python image with dependencies\n'
#docker build -t nerevarishe/saas-crm-dashboard-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf '\n\n\n'
printf 'Build node image with dependencies\n'
docker build -t nerevarishe/saas-crm-dashboard-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf '\n\n\n'


printf 'Building web app\n'
# Build backend
#docker build -t nerevarishe/saas-crm-dashboard-backend -f ./backend/Dockerfile-backend .
# Build frontend
printf 'Building frontend\n'
docker build -t nerevarishe/node-saas-crm-dashboard-build:latest -f ./frontend/Dockerfile-build .
docker build -t nerevarishe/saas-crm-dashboard-frontend -f ./frontend/Dockerfile-frontend .
printf '\n\n\n'
# Build cron

#printf 'Srtarting app'
# docker-compose up -d
#docker-compose ps
