#!/usr/bin/env bash

disk_label=$(
    ls /dev/disk/by-label | fzf --preview-window=up,40%
)
disk_path=$(
    readlink -f "/dev/disk/by-label/$disk_label"
)
disk_mount="/media/$disk_label"

sudo umount "$disk_path"

if [ -d "$disk_mount" ]; then
    sudo rm -r "$disk_mount"
fi
