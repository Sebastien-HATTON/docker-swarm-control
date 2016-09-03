#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 <volume name, eg my-configuration>"
 exit
fi


NAME=$1

echo Creating an local volume 

ID=$(docker volume create --driver local --name ${NAME})

echo ID is ${ID}

docker volume ls

docker volume inspect ${ID}

