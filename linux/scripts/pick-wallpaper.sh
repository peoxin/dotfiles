#!/usr/bin/sh

wallpaper_dir="$HOME/Pictures/Wallpapers"
wallpaper=$(cd $wallpaper_dir && fd -e png -e jpg . | fuzzel -d -p "Wallpaper: ")
[ -z "$wallpaper" ] && exit 0

hyprctl hyprpaper unload
hyprctl hyprpaper preload "${wallpaper_dir}/${wallpaper}"
hyprctl hyprpaper wallpaper ", ${wallpaper_dir}/${wallpaper}"
