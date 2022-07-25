#!/usr/bin/sh

commands=("copy" "save" "copysave" "edit")
targets=("screen" "area")
command=$(printf '%s\n' "${commands[@]}" | fuzzel -d -p "Screenshot command:")
[ -z "$command" ] && exit 0
target=$(printf '%s\n' "${targets[@]}" | fuzzel -d -p "Screenshot target:")
[ -z "$target" ] && exit 0

sleep 1
grimblast --notify $command $target
