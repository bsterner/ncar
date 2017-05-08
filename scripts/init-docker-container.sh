#!/bin/bash

while getopts "c:e:f:t:l:n:" opt; do
  case $opt in
    c)
      echo "-> Container name provided: '$OPTARG'" >&2
        export CONTAINER_NAME=$OPTARG
      ;;
    e)
      echo "-> Environment variable LIST provided: '$OPTARG'" >&2
      export ENV_ARG="-e $OPTARG"
      ;;
    f)
      echo "-> Environment variable FILE provided: '$OPTARG'" >&2
      export ENV_ARG="--env-file $OPTARG"
      ;;
    t)
      echo "-> Run mode provided: '$OPTARG'" >&2
      export RUN_MODE=test
      ;;
    l)
      echo "-> Link flag provided: '$OPTARG'" >&2
      export LINK_ARG="--link $OPTARG:$OPTARG-alias"
      ;;
    n)
      echo "-> Network flag provided: '$OPTARG'" >&2
      export NET_ARG="--network $OPTARG"
      ;;
    \?)
      echo "!! ERROR: Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [ -z $CONTAINER_NAME ]; then
  echo "-> Container named required using '-c CONTAINER_NAME'"
  exit 2
fi
