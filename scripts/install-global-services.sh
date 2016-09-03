#!/bin/bash

echo Installing DataDog

docker service create --mode global \
                      --name data-dog \
                      --label org.kurron.purpose="monitoring" \
                      --env API_KEY=4a2ad6741d78c9f690510083065a0bff \
                      --log-driver json-file \
                      --log-opt max-size=128m \
                      --log-opt max-file=4 \
                      --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
                      --mount type=bind,src=/proc/,dst=/host/proc/:ro \
                      --mount type=bind,src=/sys/fs/cgroup/,dst=/host/sys/fs/cgroup:ro \
                      datadog/docker-dd-agent:latest

docker service inspect --pretty data-dog

# required volumes:
#     ./create-nfs-volume-read-only.sh 192.168.1.234 /media media
#     ./create-nfs-volume-read-only.sh 192.168.1.234 /atlantis-sync torrent-sync
#     ./create-nfs-volume-read-write.sh 192.168.1.234 /bifrost-pc plex-config

echo Plex Media Server

docker service create --mode global \
                      --name plex \
                      --constraint 'node.labels.plex-capable==true' \
                      --publish 32400:32400 \
                      --label org.kurron.purpose="fun" \
                      --env SKIP_CHOWN_CONFIG="TRUE" \
                      --log-driver json-file \
                      --log-opt max-size=128m \
                      --log-opt max-file=4 \
                      --mount type=volume,src=plex-config,dst=/config \
                      --mount type=volume,src=torrent-sync,dst=/mnt/torrent \
                      --mount type=volume,src=media,dst=/mnt/media \
                      timhaak/plex:latest

docker service inspect --pretty plex

docker service ls

#docker service ps data-dog 
