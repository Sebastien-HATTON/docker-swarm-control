#!/bin/bash

# deploy a replicated service -- one instance on every node
# NOTE: must be run on the master node

DESCRIPTOR=`pwd`/descriptors/replicated-service-definition.yml
STACK_NAME=replicated-test

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

echo Scale the services up
SERVICE_ID=$(docker stack ps ${STACK_NAME} --quiet)
CMD="docker service scale ${SERVICE_ID}=16"
echo $CMD
${CMD}

echo Listing all services in the stack
watch docker stack services ${STACK_NAME}
sleep 1
