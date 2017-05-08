#!/bin/bash

. init-docker-image.sh

if [ -z $TAG ]; then
  TAG_LABEL=v1
  echo "-> Using default tag label: '$TAG_LABEL'"
else
  TAG_LABEL=$TAG
  echo "-> Using provided tag label: '$TAG_LABEL'"
fi

BUILD_CMD="docker build -t $IMAGE_NAME/$IMAGE_NAME-base:$TAG_LABEL ."
echo "+ Building image with command [ $BUILD_CMD ]"

$BUILD_CMD
# docker build -t $CONTAINER/$CONTAINER-base:v1 .
