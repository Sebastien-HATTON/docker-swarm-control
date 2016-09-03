#!/bin/bash

# This script will install the Docker Engine on machines in the network.  We'll be using the
# generic driver which means that we must be able to ssh into the target machines via ssh keys.
# Using a password will not work with Docker Machine.

# 01) ssh-keygen -t rsa -C 'Swarm Control' -- to generate keys on this box
# 02) ssh user@target -- to prove you can connect to the target box
# 03) ssh-copy-id user@target -- to copy this box's public key to the target box

export GENERIC_ENGINE_PORT=2376
export GENERIC_SSH_USER=vagrant
export GENERIC_SSH_PORT=22

SSH_KEY="/home/vagrant/.ssh/id_rsa"

BIFROST_IP=192.168.1.124
BIFROST_CMD="docker-machine create --driver generic \
                           --generic-ip-address=${BIFROST_IP} \
                           --generic-ssh-key ${SSH_KEY} \
                           --engine-storage-driver overlay2 \
                           --engine-opt graph=/var/lib/docker \
                           --engine-opt dns=8.8.8.8 \
                           --engine-opt log-driver=json-file \
                           bifrost"
echo $BIFROST_CMD
$BIFROST_CMD
BIFROST_GROUP="docker-machine ssh bifrost sudo usermod -aG docker ${GENERIC_SSH_USER}"
echo $BIFROST_GROUP
$BIFROST_GROUP

echo show the created engines
docker-machine ls

