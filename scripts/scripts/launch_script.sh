#!/usr/bin/env bash

options=(
    "ReloadPipewire"
    "ReloadWaybar"
    "StartDocker"
    "StopDocker"
    "SystemMaintenance"
)

handle_choice() {
    case "$1" in
        'ReloadWaybar') reload-waybar.sh ;;
        'ReloadPipewire') reload-pipewire.sh ;;
        'StartDocker') docker.sh start ;;
        'StopDocker') docker.sh stop ;;
        'SystemMaintenance') system_maintenance.sh ;;
        *) echo "Error: unrecognized option" ;;
    esac
}

choice=$(printf '%s\n' "${options[@]}" | rofi -i -dmenu)
notify-send "$choice" "$(handle_choice $choice)"
