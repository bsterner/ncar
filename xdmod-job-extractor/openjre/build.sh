#!/usr/bin/env bash
cp ../target/xdmod-job-extractor-1.1.5-SNAPSHOT.jar .
docker build -f Dockerfile . -t cisl-repo/xje_openjre:1.0
