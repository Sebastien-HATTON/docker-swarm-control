#!/bin/bash

# deploy a replicated service -- one instance on every node
# NOTE: must be run on the master node

DESCRIPTOR=`pwd`/descriptors/replicated-service-definition.yml
STACK_NAME=replicated-test

echo Deploying Stack
docker stack deploy --compose-file ${DESCRIPTOR} ${STACK_NAME}
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

echo Scale the services up
SERVICE_ID=$(docker stack services --quiet ${STACK_NAME})
docker service scale ${SERVICE_ID}=64

echo Listing all services in the stack
watch docker stack services ${STACK_NAME}
sleep 2
clear

echo Scale the services down
SERVICE_ID=$(docker stack services --quiet ${STACK_NAME})
docker service scale ${SERVICE_ID}=1

echo Listing all services in the stack
watch docker stack services ${STACK_NAME}
clear
