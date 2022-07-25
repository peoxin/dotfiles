#!/usr/bin/sh

actions=(
    "poweroff"
    "reboot"
    "suspend"
    "hibernate"
    "hybrid-sleep"
    "lock-session"
    "logout"
)
action=$(printf '%s\n' "${actions[@]}" | fuzzel -d -p "Power: ")
[ -z "$action" ] && exit 0

case "$action" in
    "lock-session")
        loginctl lock-session
        ;;
    "logout")
        loginctl terminate-session $XDG_SESSION_ID
        ;;
    *)
        systemctl $action
        ;;
esac
