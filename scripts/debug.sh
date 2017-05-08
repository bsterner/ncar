debug() {
  MSG="$1"
  if [ ! -z $DEBUG ] && [ $DEBUG = "true" ]; then
    echo "  DEBUG: --> $MSG"
  fi
}
