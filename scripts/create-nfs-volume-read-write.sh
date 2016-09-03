#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 <ip of NFS server, eg. 192.168.1.234> <NFS mount point, eg /media> <volume name, eg nfs-test>"
 exit
fi

if [ "$2" = "" ]
then
 echo "Usage: $0 <ip of NFS server, eg. 192.168.1.234> <NFS mount point, eg /media> <volume name, eg nfs-test>"
 exit
fi

if [ "$3" = "" ]
then
 echo "Usage: $0 <ip of NFS server, eg. 192.168.1.234> <NFS mount point, eg /media> <volume name, eg nfs-test>"
 exit
fi

ADDR=$1
DEVICE=$2
NAME=$3

echo Creating an NFS volume 

ID=$(docker volume create --driver local --opt type=nfs --opt o=addr=${ADDR},rw --opt device=:${DEVICE} --name ${NAME})

echo ID is ${ID}

docker volume ls

docker volume inspect ${ID}

