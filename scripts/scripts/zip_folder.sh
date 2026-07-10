#/usr/bin/env bash

folder=$1

zip -vr "$1.zip" "$1/" -x "*.DS_Store"
