#!/bin/bash

echo Capture the manager and worker tokens
MANAGER_TOKEN=$(docker swarm join-token --quiet manager)
WORKER_TOKEN=$(docker swarm join-token --quiet worker)

echo Manager Token is ${MANAGER_TOKEN}
echo Worker Token is ${WORKER_TOKEN}

