#!/usr/bin/env bash

connection=$(nmcli connection show | awk '{print $1}' | rg -v "NAME|lo" | fuzzel -d -p "Connect: ")
[ -z "$connection" ] && exit 0

nmcli connection up $connection
