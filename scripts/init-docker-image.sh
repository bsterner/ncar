#!/bin/bash

while getopts ":i:a" opt; do
  case $opt in
    i)
      echo "-> Image name provided: '$OPTARG'" >&2
      export IMAGE_NAME=$OPTARG
      ;;
    \?)
      echo "!! ERROR: Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [ -z $IMAGE_NAME ]; then
  echo "-> Image named required using '-i IMAGE_NAME'"
  exit 2
fi
