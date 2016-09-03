#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 <manager ip, eg 192.168.1.22> <swarm token, eg SWMTKN-1-67>"
 exit
fi

if [ "$2" = "" ]
then
 echo "Usage: $0 <manager ip, eg 192.168.1.22> <swarm token, eg SWMTKN-1-67>"
 exit
fi

MANAGER=$1
TOKEN=$2

echo Joining the Swarm, making this host the Manager
docker swarm join --token ${TOKEN} ${MANAGER}:2377

echo List nodes in the Swarm
docker node ls
