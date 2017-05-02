#!/bin/sh
PORT=$(vagrant ssh-config | grep Port | grep -o '[0-9]\+')

BYPASS="false"
if [ -z $BYPASS ]; then
	echo "SSH Command about to be executed..."
	echo "ssh -q "
	echo "    -o UserKnownHostsFile=/dev/null "
	echo "    -o StrictHostKeyChecking=no "
	echo "    -i ~/.vagrant.d/insecure_private_key "
	echo "    vagrant@localhost "
	echo "    -p $PORT "
	echo "    \"$@\" "
	echo
	sleep 2
fi
ssh -q \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -i ~/.vagrant.d/insecure_private_key \
    vagrant@localhost \
    -p $PORT \
    "$@"
