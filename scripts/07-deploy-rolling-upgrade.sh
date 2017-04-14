#!/bin/bash

# deploy a replicated service -- one instance on every node
# NOTE: must be run on the master node

DESCRIPTOR_V1=`pwd`/DESCRIPTOR_V1s/rolling-upgrade-v1-service-definition.yml
STACK_NAME=upgrade-test

echo Deploying Stack
docker stack deploy --compose-file ${DESCRIPTOR_V1} ${STACK_NAME}
sleep 2
clear

echo List all stacks
docker stack ls
sleep 2
clear

echo Listing all services in the stack
docker stack services ${STACK_NAME}
sleep 2
clear

echo Listing all tasks in the stack
watch docker stack ps ${STACK_NAME}
clear
