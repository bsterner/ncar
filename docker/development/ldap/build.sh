#!/bin/bash
. .env

docker rm --force $CONTAINER_NAME
docker build -t $IMAGE_NAME .
