#!/usr/bin/env bash
docker rm --force spring-boot-docker

docker run -d \
    --name spring-boot-docker \
    -p 9080:8080 \
    springio/spring-boot-docker:latest
