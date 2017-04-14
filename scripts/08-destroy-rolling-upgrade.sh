#!/bin/bash

# clean up the rolling upgrade service example
# NOTE: must be run on the master node

STACK_NAME=upgrade-test

echo Destoying Stack
docker stack rm ${STACK_NAME}
sleep 1

echo List all stacks
docker stack ls
sleep 1
