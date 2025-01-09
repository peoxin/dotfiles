#!/usr/bin/sh

connection=$(nmcli connection show | awk '{print $1}' | rg -v "NAME|lo" | fuzzel -d -p "Select connection: ")
[ -z "$connection" ] && exit 0

nmcli connection up $connection
