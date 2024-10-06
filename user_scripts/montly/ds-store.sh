#!/usr/bin/env bash

# Improved find command with no max depth limit
find /mnt/user -type f -name ".DS_Store" -delete

/usr/local/emhttp/webGui/scripts/notify -e ".DS_Store" -d "Files Removed"