#!/bin/bash

# NOTE: it appears that the docker stack command will also build the nework so we don't need this any longer
# creates an overlay network that the swarm will use
# NOTE: must be run on the master node

NETWORK_NAME=${1:-development}

echo Creating overlay network for the application containers
docker network create --driver overlay ${NETWORK_NAME}
docker network ls
docker network inspect ${NETWORK_NAME}
