#!/usr/bin/env bash

# Script to create symbolic links for frequently used directories

# Declare an associative array with source and destination paths
declare -A symlinks=(
    ["/mnt/user/data"]="/root/data"
    ["/mnt/user/appdata"]="/root/appdata"
)

# Create the symbolic links
for src in "${!symlinks[@]}"; do
    dest=${symlinks[$src]}
    if [ -e "$dest" ]; then
        echo "Skipping $dest: File or directory already exists."
    else
        ln -s "$src" "$dest"
        if [ $? -eq 0 ]; then
            echo "Created symlink: $dest -> $src"
        else
            echo "Failed to create symlink: $dest -> $src"
        fi
    fi
done