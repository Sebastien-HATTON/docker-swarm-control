#!/bin/bash

# Installs Plex media server outside of the Swarm because of DNS load balancing and network stack issues

#   plex:
#       image: timhaak/plex:latest
#       container_name: plex
#       restart: always
#       network_mode: host
#       volumes:
#       - plex-config:/config
#       - media:/mnt/media:ro
#       - torrent-sync:/mnt/torrent:ro
#       environment:
#           SKIP_CHOWN_CONFIG: "TRUE"

# can't use Docker Compose because it doesn't understand pre-created volumes
CMD="docker run --detach \
                --dns 8.8.8.8 \
                --env SKIP_CHOWN_CONFIG='TRUE' \
                --name plex \
                --network host \
                --restart always \
                --volume plex-config:/config \
                --volume media:/mnt/media:ro \
                --volume torrent-sync:/mnt/torrent:ro \
                timhaak/plex:latest"
echo $CMD
$CMD
docker logs --follow plex

