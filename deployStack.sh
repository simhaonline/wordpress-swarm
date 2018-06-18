#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


usageMessage () {
  echo "Usage: $0 [-h] stackName"
  echo " stackName: the stack name to use. Mandatory"
  echo " -h: display this message"
}


if [ $# -eq 0 ]
  then
    echo "No arguments supplied, exit."
    usageMessage
    exit -1
elif [ "$1" == "-h" ]
  then
    usageMessage
    exit 0
fi


DELAY=5
if [ "$1" != "${SCRIPT_DIR##*/}" ]
  then
    echo "stack name mismatch with stack directory name ''"
    echo "We let you the option to Ctrl+C now (during $DELAY seconds)"
    sleep $DELAY
fi

STACKNAME="$1"

StackFile="$SCRIPT_DIR/swarm.yml"

STACKNAME=$STACKNAME docker stack deploy -c $StackFile "$1"
