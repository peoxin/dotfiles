#!/usr/bin/sh

pid=$(pidof -x "$(basename "$0")")
for p in $pid; do
    if [ $p != $$ ]; then
        kill -9 $p
    fi
done

dark_start=1800
dark_end=0600

current_time=$(date +%H%M)

while true; do
    if [ "$current_time" -gt "$dark_start" ] || [ "$current_time" -lt "$dark_end" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita:dark'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    else
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita:light'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    fi
    sleep 1200
done
