#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 <node, eg bifrost> <label, eg plex-capable=true>"
 exit
fi

if [ "$2" = "" ]
then
 echo "Usage: $0 <node, eg bifrost> <label, eg plex-capable=true>"
 exit
fi

NODE=$1
LABEL=$2

echo Adding label ${LABEL} to node ${NODE} 

docker node update --label-add ${LABEL} ${NODE}
docker node inspect ${NODE}


