#!/bin/bash

while getopts ":e:ef:" opt; do
  case $opt in
    e)
      echo "-> Environment variable LIST provided: '$OPTARG'" >&2
      export ENV_ARG="-e $OPTARG"
      ;;
    ef)
    echo "-> Environment variable FILE provided: '$OPTARG'" >&2
      export ENV_ARG="--env-file $OPTARG"
      ;;
    \?)
      echo "No environment variables set..." >&2
      ;;
  esac
done
