#!/usr/bin/env bash

disk_label=$(
    ls /dev/disk/by-label | fzf --preview-window=up,40%
)
disk_path=$(
    readlink -f "/dev/disk/by-label/$disk_label"
)
disk_mount="/media/$disk_label"

echo "$disk_path -> $disk_mount"

if [ ! -d "$disk_mount" ]; then
    sudo mkdir "$disk_mount"
fi
sudo mount "$disk_path" "$disk_mount"
