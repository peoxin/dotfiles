#!/usr/bin/env bash

if [[ `pacman -Qi rofi > /dev/null 2>&1` ]]; then
    sudo pacman -S rofi
fi
if [[ ! -d $HOME/.config/rofi ]]; then
    mkdir $HOME/.config/rofi
fi
if [[ -f $HOME/.config/rofi/config.rasi ]]; then
    mv $HOME/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi.old
fi
ln -sf $HOME/dotfiles/rofi/config.rasi $HOME/.config/rofi/config.rasi
