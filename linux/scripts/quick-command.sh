#! /usr/bin/sh

commands=(
    "screenshot"
    "audio-control"
    "clipboard-history"
    "pick-wallpaper"
)
command=$(printf '%s\n' "${commands[@]}" | fuzzel -d -p "Command: ")
$command
