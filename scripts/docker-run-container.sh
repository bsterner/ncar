#!/bin/bash

. init-docker-container.sh

if [ -z $TAG ]; then
  TAG_LABEL=v1
  echo "-> Using default tag label: '$TAG_LABEL'"
else
  TAG_LABEL=$TAG
  echo "-> Using provided tag label: '$TAG_LABEL'"
fi

# Base docker run command
RUN_CMD="docker run -d --name $CONTAINER_NAME-container"

# Add the environment flags if present
if [ ! -z "$ENV_ARG" ]; then
  RUN_CMD="$RUN_CMD $ENV_ARG"
fi

# Add the link flags if present
if [ ! -z "$LINK_ARG" ]; then
  RUN_CMD="$RUN_CMD $LINK_ARG"
fi

# Add the link flags if present
if [ ! -z "$NET_ARG" ]; then
  RUN_CMD="$RUN_CMD $NET_ARG"
fi

# Execute the full command
RUN_CMD="$RUN_CMD $CONTAINER_NAME/$CONTAINER_NAME-base:$TAG_LABEL"

echo "+ Running container with command [ $RUN_CMD ]"

# Check run mode
if [ ! -z "$RUN_MODE" ] && [ $RUN_MODE = "test" ]; then
  exit 0
fi

$RUN_CMD

# docker build -t $CONTAINER/$CONTAINER-base:v1 .
