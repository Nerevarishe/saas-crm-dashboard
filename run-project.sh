#!/bin/bash

printf 'Building default images\n'
printf 'Build clear Alpine image'
#docker build -t nerevarishe/alpine:latest -f ./alpine-default-images/Dockerfile-clear-alpine-image .
printf '\n\n\n'
printf 'Build clear python alpine image'
#docker build -t nerevarishe/python-alpine:latest -f ./alpine-default-images/Dockerfile-python-alpine-image .
printf '\n\n\n'
printf 'Build clear node alpine image'
#docker build -t nerevarishe/node-alpine:latest -f ./alpine-default-images/Dockerfile-node-alpine-image .
printf '\n\n\n'
printf 'Build clear nginx alpine image'
#docker build -t nerevarishe/nginx-alpine:latest -f ./alpine-default-images/Dockerfile-nginx-alpine-image .
printf '\n\n\n'
# Build database image

printf 'Building dependencies images'
printf 'Build python image with dependencies'
#docker build -t nerevarishe/saas-crm-dashboard-python-dependencies:latest -f ./alpine-deps-images/Dockerfile-python .
printf '\n\n\n'
printf 'Build node image with dependencies'
#docker build -t nerevarishe/saas-crm-dashboard-node-dependencies:latest -f ./alpine-deps-images/Dockerfile-node .
printf '\n\n\n'

#printf 'Building web app'
# Build backend
# Build frontend
# Build cron

#printf 'Srtarting app'
# docker-compose up -d
