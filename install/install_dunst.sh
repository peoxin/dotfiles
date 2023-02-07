#!/usr/bin/env bash

if [[ `pacman -Qi dunst > /dev/null 2>&1` ]]; then
    sudo pacman -S dunst
fi
if [[ ! -d $HOME/.config/dunst ]]; then
    mkdir $HOME/.config/dunst
fi
if [[ -f $HOME/.config/dunst/dunstrc ]]; then
    mv $HOME/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc.old
fi
ln -sf $HOME/dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc
