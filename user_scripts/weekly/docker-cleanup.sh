#!/usr/bin/env bash

echo "Removing dangling Docker images..."

# Check if there are any dangling images and remove them
dangling_images=$(docker images --quiet --filter "dangling=true")

if [ -n "$dangling_images" ]; then
    docker rmi $dangling_images
    echo "Dangling images removed."
    /usr/local/emhttp/webGui/scripts/notify -e "Docker" -d "Dangling images removed"
else
    echo "No dangling images found."
    /usr/local/emhttp/webGui/scripts/notify -e "Docker" -d "No dangling images found"
fi