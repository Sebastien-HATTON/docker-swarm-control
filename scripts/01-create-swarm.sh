#!/bin/bash

# IMPORTANT: run this from the 10.10.10.10 node

echo Creating the Swarm, making this host the Manager
docker swarm init --advertise-addr 10.10.10.10

echo Capture the manager and worker tokens
MANAGER_TOKEN=$(docker swarm join-token --quiet manager)
WORKER_TOKEN=$(docker swarm join-token --quiet worker)

echo Manager Token is ${MANAGER_TOKEN}
echo Worker Token is ${WORKER_TOKEN}

echo Joining remaining nodes to the Swarm as Workers
ssh 10.10.10.11 sudo docker swarm join --token $WORKER_TOKEN 10.10.10.10:2377
ssh 10.10.10.12 sudo docker swarm join --token $WORKER_TOKEN 10.10.10.10:2377
ssh 10.10.10.13 sudo docker swarm join --token $WORKER_TOKEN 10.10.10.10:2377
ssh 10.10.10.14 sudo docker swarm join --token $WORKER_TOKEN 10.10.10.10:2377

echo List nodes in the Swarm
docker node ls
