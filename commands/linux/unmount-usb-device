#!/usr/bin/env bash

devices=$(lsblk -o NAME,MOUNTPOINT -l --noheadings | awk '$2 ~ /^\/run\/media\// {print "/dev/" $1 " (" $2 ")"}')
device=$(echo "$devices" | fuzzel -d -w 45 -p "Unmount: ")
[ -z "$device" ] && exit 0

device_path=$(echo "$device" | awk '{print $1}')
udisksctl unmount -b "$device_path"
