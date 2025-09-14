#!/usr/bin/env bash

actions=("copy" "save" "copysave" "edit")
action=$(printf '%s\n' "${actions[@]}" | fuzzel -d -p "Screenshot:")
[ -z "$action" ] && exit 0

targets=("screen" "area")
target=$(printf '%s\n' "${targets[@]}" | fuzzel -d -p "Target:")
[ -z "$target" ] && exit 0

sleep 1
case $action in
edit)
    grimblast save $target - | swappy -f -
    ;;
*)
    grimblast --notify $command $target
    ;;
esac
