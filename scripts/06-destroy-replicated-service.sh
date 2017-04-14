#!/bin/bash

# clean up the replicated service example
# NOTE: must be run on the master node

STACK_NAME=replicated-test

echo Destoying Stack
docker stack rm ${STACK_NAME}
sleep 1

echo List all stacks
docker stack ls
sleep 1
