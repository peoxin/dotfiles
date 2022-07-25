#!/usr/bin/sh

options=("light-mode" "dark-mode")
option=$(printf '%s\n' "${options[@]}" | fuzzel -d -p "Select mode: ")
[ -z $option ] && exit 0

if [ $option == "light-mode" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita:light'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    notify-send "Switched to Light Mode"
else
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita:dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    notify-send "Switched to Dark Mode"
fi
