#!/bin/bash

# Installs BitTorrent Sync server outside of the Swarm because of DNS load balancing and network stack issues

#   torrent-sync:
#       image: kurron/docker-bittorrent-sync:latest
#       container_name: torrent-sync
#       restart: always
#       network_mode: host
#       volumes:
#       - /mnt/torrent-book:/mnt/sync/bookkeeping
#       - /mnt/torrent-sync:/mnt/sync

# can't use Docker Compose because it doesn't understand pre-created volumes
CMD="docker run --detach \
                --dns 8.8.8.8 \
                --name torrent-sync \
                --network host \
                --restart always \
                --volume torrent-book:/mnt/sync/bookkeeping:rw \
                --volume torrent-sync:/mnt/sync:rw \
                kurron/docker-bittorrent-sync:latest"
echo $CMD
$CMD
docker logs --follow torrent-sync

