#!/bin/bash

# Need this so rvm switches version
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export DEBUG=false

. debug.sh

while getopts "p:a:" opt; do
  case $opt in
    a)
      debug "Rails app directory: '$OPTARG'"
      export RAILS_APP_DIR=$OPTARG
      ;;
    p)
      debug "Rails port: '$OPTARG'"
      export RAILS_PORT=$OPTARG
      ;;
    \?)
      debug "!! ERROR: Invalid option: -$OPTARG"
      exit 1
      ;;
  esac
done

XRAS_DIR=~/Development/ijworkspace/xsede
RAILS_APP_PATH=$XRAS_DIR/$RAILS_APP_DIR

if [ -z $RAILS_APP_DIR ]; then
  echo "-> ERROR: Rails port required using '-p RAILS_PORT'"
  exit 2
elif [[ ! -d $RAILS_APP_PATH ]]; then
  echo "-> ERROR: Rails application directory ['$RAILS_APP_PATH'] does not exist"
  exit 3
fi

pushd $RAILS_APP_PATH >/dev/null

# Make sure we're using the correct rails gem
RAILS_BIN_PATH=$RAILS_APP_PATH/bin/rails

# Start service in daemon mode
RAILS_SERVER_LOG=$RAILS_APP_PATH/log/server.log
CMD="bundle exec $RAILS_BIN_PATH server -p $RAILS_PORT -d"
export PATH=$RAILS_APP_PATH/bin:$PATH

echo "==========================================================================="
echo "Starting rails server on port ['$RAILS_PORT']"
echo "  => PWD: [ `pwd` ]"
echo "  => CMD: [ $CMD ]"
echo "  => APP PATH: ['$RAILS_APP_PATH']"
echo "  => RAILS BIN PATH: ['$RAILS_BIN_PATH']"
echo "  => LOG FILE: ['$RAILS_SERVER_LOG']"
echo "  => PATH: ['$PATH']"
echo "==========================================================================="

# Execute!
$CMD 2>&1 >$RAILS_SERVER_LOG

echo
echo "--------------------------------------------------------------------------"
echo "Checking server status..."
echo "--------------------------------------------------------------------------"
ps -aef | grep "rails server"

popd >/dev/null
