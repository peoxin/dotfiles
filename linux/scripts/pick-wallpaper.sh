#! /usr/bin/sh

wallpaper_dir="$HOME/Pictures"
wallpaper=$(cd $wallpaper_dir && fd -e png -e jpg . | fuzzel -d -p "Wallpaper: ")
hyprctl hyprpaper unload
hyprctl hyprpaper preload "${wallpaper_dir}/${wallpaper}"
hyprctl hyprpaper wallpaper ", ${wallpaper_dir}/${wallpaper}"
