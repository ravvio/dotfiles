#!/usr/bin/env bash

killall waybar &> /dev/null
$(waybar &> /dev/null) & disown
echo "Waybar Reloaded"

