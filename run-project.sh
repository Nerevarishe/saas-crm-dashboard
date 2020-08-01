#!/bin/bash

echo 'Building default images'
docker build -f ./alpine-default-images/Dockerfile-clear-alpine-image -t nerevarishe/alpine:latest
docker build -f ./alpine-default-images/Dockerfile-python-alpine-image -t nerevarishe/python-alpine:latest
docker build -f ./alpine-default-images/Dockerfile-node-alpine-image -t nerevarishe/node-alpine:latest
docker build -f ./alpine-default-images/Dockerfile-nginx-alpine-image -t nerevarishe/nginx-alpine:latest
# Build database image

echo 'Building dependencies images'
# Build python image with dependencies
# Build node image with dependencies

echo 'Building web app'
# Build backend
# Build frontend
# Build cron

echo 'Srtarting app'
docker-compose up -d
