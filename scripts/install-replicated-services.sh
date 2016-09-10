#!/bin/bash

echo Installing Ratpack Echo

docker service create --mode replicated \
                      --replicas=1 \
                      --name ratpack-echo-replicated \
                      --endpoint-mode vip \
                      --publish 6060:5050 \
                      --label org.kurron.purpose="monitoring" \
                      --log-driver json-file \
                      --log-opt max-size=128m \
                      --log-opt max-file=4 \
                      kurron/docker-ratpack-echo:1.0.0

docker service inspect --pretty ratpach-echo-replicated

# required volumes:
#     ./create-nfs-volume-read-write.sh 192.168.1.234 /atlantis-jfrog-data artifactory-data
#     ./create-nfs-volume-read-write.sh 192.168.1.234 /atlantis-jfrog-etc artifactory-etc
#     ./create-local-volume.sh artifactory-logs
#     ./create-local-volume.sh artifactory-backup

echo Installing Artifactory

docker service create --mode replicated \
                      --replicas=1 \
                      --name artifactory \
                      --constraint 'node.labels.artifactory-capable==true' \
                      --endpoint-mode vip \
                      --publish 8081:8081 \
                      --label org.kurron.purpose="development" \
                      --env ARTIFACTORY_HOME=/var/opt/jfrog/artifactory \
                      --log-driver json-file \
                      --log-opt max-size=128m \
                      --log-opt max-file=4 \
                      --mount type=volume,src=artifactory-logs,dst=/var/opt/jfrog/artifactory/logs \
                      --mount type=volume,src=artifactory-backup,dst=/var/opt/jfrog/artifactory/backup \
                      --mount type=volume,src=artifactory-data,dst=/var/opt/jfrog/artifactory/data \
                      --mount type=volume,src=artifactory-etc,dst=/var/opt/jfrog/artifactory/etc \
                      jfrog-docker-reg2.bintray.io/jfrog/artifactory-oss:latest

docker service inspect --pretty artifactory

docker service ls

#docker service ps artifactory
