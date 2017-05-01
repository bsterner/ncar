#!/usr/bin/env bash

docker run -d \
    --name xje_openjre \
    -p 1443:10443 \
    cisl-repo/xje_openjre:1.0
