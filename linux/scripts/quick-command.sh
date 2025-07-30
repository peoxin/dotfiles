#!/usr/bin/env bash

commands=(
    "audio"
    "power"
    "clipboard"
    "screenshot"
    "wallpaper"
    "network-connect"
    "bluetooth-connect"
    "unmount-usb-device"
)
command=$(printf '%s\n' "${commands[@]}" | fuzzel -d -p "Command: ")
[ -z "$command" ] && exit 0

$command
