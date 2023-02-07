#!/usr/bin/env bash

if [[ `pacman -Qi polybar > /dev/null 2>&1` ]]; then
    sudo pacman -S polybar
fi
if [[ ! -d $HOME/.config/polybar ]]; then
    mkdir $HOME/.config/polybar
fi
if [[ -f $HOME/.config/polybar/config.ini ]]; then
    mv $HOME/.config/polybar/config.ini $HOME/.config/polybar/config.ini.old
fi
ln -sf $HOME/dotfiles/polybar/config.ini $HOME/.config/polybar/config.ini
