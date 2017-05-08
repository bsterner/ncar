# Need this so rvm switches version
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export DEBUG=false

. debug.sh

while getopts "a:" opt; do
  case $opt in
    a)
      debug "Rails app directory: '$OPTARG'"
      export RAILS_APP_DIR=$OPTARG
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

# Start service in daemon mode
PID_FILE=tmp/pids/server.pid
SERVER_PID=`cat $PID_FILE`
if [ ! -f $PID_FILE ]; then
  echo "-> ERROR: Missing rails server.pid file"
  exit 2
elif [ -z $SERVER_PID ]; then
  echo "-> ERROR: Rails server pid is empty"
  exit 2
fi

CMD="kill -9 $SERVER_PID"

echo "==========================================================================="
echo "Stopping rails server with PID ['$SERVER_PID']"
echo "  => CMD: [ $CMD ]"
echo "==========================================================================="

# Execute!
$CMD

echo
echo "--------------------------------------------------------------------------"
echo "Checking server status..."
echo "--------------------------------------------------------------------------"
ps -aef | grep "rails server"


popd >/dev/null
