#!/usr/bin/env bash

actions=(
    "active-sink-port"
    "active-source-port"
    "set-sink-port"
    "set-source-port"
    "sink-volume"
    "sink-volume-up"
    "sink-volume-down"
    "source-volume"
    "source-volume-up"
    "source-volume-down"
    "toggle-sink-mute"
    "toggle-source-mute"
)
action=$(printf '%s\n' "${actions[@]}" | fuzzel -d -p "Audio: ")
[ -z "$action" ] && exit 0

case "$action" in
"active-sink-port")
    sink=$(pactl get-default-sink)
    port=$(pactl list sinks | awk -v sink="$sink" '
            $0 ~ "Name: " {current_sink=$2}
            current_sink == sink && $0 ~ "Active Port: " {print $3; exit}
        ')
    notify-send "Active Sink Port" "Sink: $sink\nPort: $port"
    ;;
"active-source-port")
    source=$(pactl get-default-source)
    port=$(pactl list sources | awk -v source="$source" '
            $0 ~ "Name: " {current_source=$2}
            current_source == source && $0 ~ "Active Port: " {print $3; exit}
        ')
    notify-send "Active Source Port" "Source: $source\nPort: $port"
    ;;
"set-sink-port")
    sink=$(pactl list sinks short | awk '{print $2}' | fuzzel -d -w 55 -p "Select sink: ")
    [ -z "$sink" ] && exit 0
    port=$(pactl list sinks | awk -v sink="$sink" '
            $0 ~ "Name: " {current_sink=$2}
            current_sink == sink && $1 == "Ports:" {in_ports=1; next}
            in_ports && $1 == "Active" {in_ports=0}
            in_ports { sub(/:$/, "", $1); print $1 }
        ' | fuzzel -d -p "Select port: ")
    [ -z "$port" ] && exit 0
    pactl set-default-sink "$sink"
    pactl set-sink-port "$sink" "$port"
    notify-send "Set Sink Port" "Sink: $sink\nPort: $port"
    ;;
"set-source-port")
    source=$(pactl list sources short | awk '{print $2}' | fuzzel -d -w 55 -p "Select source: ")
    [ -z "$source" ] && exit 0
    port=$(pactl list sources | awk -v source="$source" '
            $0 ~ "Name: " {current_source=$2}
            current_source == source && $1 == "Ports:" {in_ports=1; next}
            in_ports && $1 == "Active" {in_ports=0}
            in_ports { sub(/:$/, "", $1); print $1 }
        ' | fuzzel -d -p "Select port: ")
    [ -z "$port" ] && exit 0
    pactl set-default-source "$source"
    pactl set-source-port "$source" "$port"
    notify-send "Set Source Port" "Source: $source\nPort: $port"
    ;;
"sink-volume")
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    notify-send "Sink Volume" "Volume: $volume\nMute: $mute"
    ;;
"sink-volume-up")
    pactl set-sink-volume @DEFAULT_SINK@ +10%
    ;;
"sink-volume-down")
    pactl set-sink-volume @DEFAULT_SINK@ -10%
    ;;
"source-volume")
    volume=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '{print $5}')
    mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    notify-send "Source Volume" "Volume: $volume\nMute: $mute"
    ;;
"source-volume-up")
    pactl set-source-volume @DEFAULT_SOURCE@ +10%
    ;;
"source-volume-down")
    pactl set-source-volume @DEFAULT_SOURCE@ -10%
    ;;
"toggle-sink-mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
"toggle-source-mute")
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
*) ;;
esac
