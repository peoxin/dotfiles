#!/usr/bin/sh

devices=$(bluetoothctl devices | rg Device | sd "Device\s+" "")
device_names=$(echo "$devices" | awk '{$1=""; print substr($0,2)}')

device_name=$(echo "$device_names" | fuzzel -d -p "Select device: ")
[ -z "$device_name" ] && exit 0

device_mac=$(echo "$devices" | awk -v name="$selected_name" '$0 ~ name {print $1}')
bluetoothctl connect $device_mac

if [ $? -eq 0 ]; then
    notify-send "Bluetooth" "Connected to $device_name"
else
    notify-send "Bluetooth" "Failed to connect to $device_name"
fi
