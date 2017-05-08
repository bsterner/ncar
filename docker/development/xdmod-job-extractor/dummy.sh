#!/bin/bash

docker rm --force dummy
docker run -d --name dummy \
    cisl-repo/xdmod_cisl_job_extractor:1.0

