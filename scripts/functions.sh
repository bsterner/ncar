#!/bin/bash

# Functions (can be used like aliases)
wcat() {
  wcmd $1 cat
}

wvi() {
  wcmd $1 vi
}

wless() {
  wcmd $1 less
}

wcmd() {
  if [ -z "$1" -o -z "$2" ]; then
    echo "Please provide 1) the item to search for and display 2) the command to execue on the item"
  else
    echo "~> '$2 `which $1`'"
    $2 `which $1`
  fi
}

dba() {
  if [ -z $1 ]; then
    echo "Please provide the docker container name to attach to or attach manually using 'docker exec -it {CONTAINER_NAME} bash -l'"
  else
    echo Trying to connect to docker container $1
    docker exec -it $1 bash -l
  fi
}

dsa() {
  if [ -z $1 ]; then
    echo "Please provide the docker container name to attach to"
  else
    echo Trying to connect to docker container $1
    docker exec -it $1 sh -l
  fi
}

drm() {
  if [ -z $1 ]; then
    echo "Please provide the docker container name to delete"
  else
    echo Deleting container: $1
    docker stop $1
    docker rm $1
  fi
}

we() {
  if [ -z $1 ]; then
    echo "Please provide the object to search for"
#  elif [ ! -f $1 ]; then
#    echo "File $1 does not exist"
  else
    script=`which $1`
    echo 'Executing $script'
    $script
  fi
}

# Explanation:
# -H : Print the file name for each match.
# -l : Suppress normal output
fgrep() {
  if [ -z "$1" -o -z "$2" ]; then
    echo "Please provide the file name pattern & value to search for"
  else
    echo "~> find . -maxdepth 4 -name '$1' -exec grep -Hl "$2" {} \;"
    `find . -maxdepth 4 -name '$1' -exec grep -Hl "$2" {} \;`
  fi
}

#docker_container_exists() {
#  echo "Argument passed=$1"
##return 1
#echo "hi"
## container_string=$1
##testme="^/$container_string\(-container\)?$"
##echo testme=$testme
##return false
##  if [ ! -z "`docker ps -a -f name=^/${container_string}\(-container\)?$`" ]; then
##    return true
##  else
##    return false
##  fi
#}


# ============================================================================ #
# ============================= SAMPLE FUNCTIONS ============================= #
# A somewhat more complex function.
repeater () {
  i=0
  REPEATS=30

  echo
  echo "And now the fun really begins."
  echo

  sleep $JUST_A_SECOND    # Hey, wait a second!
  while [ $i -lt $REPEATS ]
  do
    echo "----------FUNCTIONS ARE FUN [$i] ---------->"
    let "i+=1"
  done
}
# ============================================================================ #
