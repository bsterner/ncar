#!/usr/bin/env bash

source ~/.secrets

docker build -f Dockerfile . \
    --build-arg GITHUB_PASSWORD=${SECRET_PASSWORD} \
    -t cisl-repo/xdmod_job_extractor_maven:1.0
