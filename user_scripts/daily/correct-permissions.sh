#!/usr/bin/env bash

# Directories and their respective owners and groups
declare -A directories=(
    ["/root/data/documents"]="nobody:nobody"
    #["/root/data/media"]="nobody:nobody"
    ["/root/data/downloads"]="nobody:nobody"
    ["/root/data/backup"]="nobody:nobody"
    ["/root/data/vanessa"]="vanessaferreira:users"
    ["/root/data/diogo"]="diogonr:users"
)

# Change ownership and permissions
for dir in "${!directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "Processing $dir with owner:group ${directories[$dir]}"
        chown -R "${directories[$dir]}" "$dir"
        chmod -R 755 "$dir"
        echo "Permissions corrected for $dir"
    else
        echo "Skipping $dir: Directory does not exist."
    fi
done

/usr/local/emhttp/webGui/scripts/notify -e "Permissions" -d "Updated"