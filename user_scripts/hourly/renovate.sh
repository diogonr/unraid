#!/usr/bin/env bash

# Check if the container is already running
if [ "$(docker ps -q -f name=renovate)" ]; then
  echo "Renovate container is already running."
  exit 0
fi

# Check if the container exists (but is not running)
if [ ! "$(docker ps -a -q -f name=renovate)" ]; then
  /usr/local/emhttp/webGui/scripts/notify -i "alert" -e "Renovate" -d "Renovate container not found."
  echo "Renovate container not found."
  exit 1
fi

# Notify and start the container
docker container start renovate
echo "Renovate container started."
/usr/local/emhttp/webGui/scripts/notify -e "Renovate" -d "Completed @ $(date +%H:%M:%S)."