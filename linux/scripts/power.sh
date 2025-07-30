#!/usr/bin/env bash

actions=(
    "lock"
    "logout"
    "poweroff"
    "reboot"
    "suspend"
    "hibernate"
    "hybrid-sleep"
)
action=$(printf '%s\n' "${actions[@]}" | fuzzel -d -p "Power: ")
[ -z "$action" ] && exit 0

case "$action" in
"lock")
    loginctl lock-session
    ;;
"logout")
    loginctl terminate-session $XDG_SESSION_ID
    ;;
*)
    systemctl $action
    ;;
esac
