#!/usr/bin/env bash

path=$1
dirname=$2

echo "Finding $2"

paths=()
while IFS= read -d '' -r filename; do
    paths+=("$filename")
done < <(find $path -name "$dirname" -type d -prune -print0)

for p in ${paths[@]}; do
    echo ""
    du -d 0 -h "$p"
    read -p "Delete? (yes/no) " answer
    if [[ "$answer" == "yes" ]]; then
        rm -rf "$p"
        echo "... Done"
    else
        echo "... Skipped"
    fi
done
