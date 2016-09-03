#!/bin/bash

echo Creating the Swarm, making this host the Manager
#docker swarm init --advertise-addr 10.10.10.20
docker swarm init

echo Capture the manager and worker tokens
MANAGER_TOKEN=$(docker swarm join-token --quiet manager)
WORKER_TOKEN=$(docker swarm join-token --quiet worker)

echo Manager Token is ${MANAGER_TOKEN}
echo Worker Token is ${WORKER_TOKEN}

echo List nodes in the Swarm
docker node ls
