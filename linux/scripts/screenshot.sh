#! /usr/bin/sh

commands=("copy" "save" "copysave" "edit")
targets=("screen" "area")
command=$(printf '%s\n' "${commands[@]}" | fuzzel -d -p "Screenshot Command:")
target=$(printf '%s\n' "${targets[@]}" | fuzzel -d -p "Screenshot Target:")

grimblast $command $target

if [ $? -eq 0 ]; then
    if [ $command = "save" ] || [ $command = "copysave" ]; then
        notify-send "Screenshot saved"
    elif [ $command = "copy" ]; then
        notify-send "Screenshot copied"
    fi
else
    notify-send "Screenshot failed"
fi
