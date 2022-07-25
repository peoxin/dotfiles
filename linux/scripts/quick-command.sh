#!/usr/bin/sh

commands=(
    "screenshot"
    "clipboard-history"
    "audio-control"
    "network-connect"
    "bluetooth-connect"
    "unmount-usb-device"
    "power-management"
    "pick-wallpaper"
    "switch-light-dark-mode"
)
command=$(printf '%s\n' "${commands[@]}" | fuzzel -d -p "Command: ")
[ -z "$command" ] && exit 0

$command
