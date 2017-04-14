#!/bin/bash

# deploy a global service -- one instance on every node
# NOTE: must be run on the master node

DESCRIPTOR=`pwd`/descriptors/global-service-definition.yml
STACK_NAME=global-test

echo Deploying Stack
docker stack deploy --compose-file ${DESCRIPTOR} ${STACK_NAME}
sleep 1

echo List all stacks
docker stack ls
sleep 1

echo Listing all services in the stack
docker stack services ${STACK_NAME}
sleep 1

echo Listing all tasks in the stack
watch docker stack ps ${STACK_NAME}
sleep 1
