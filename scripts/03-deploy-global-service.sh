#!/bin/bash

# deploy a global service -- one instance on every node
# NOTE: must be run on the master node

DESCRIPTOR=`pwd`/descriptors/global-service-definition.yml
STACK_NAME=global-test

echo Deploying service
docker stack deploy --compose-file ${DESCRIPTOR} ${STACK_NAME}
sleep 1

echo Inspecting service
docker service inspect --pretty global-service
sleep 1

echo Listing all services
docker service ls
sleep 1

echo Watching service get deployed
watch 'docker service ps global-service'
