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

docker service ls

#docker service ps data-dog 
