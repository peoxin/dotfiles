#!/usr/bin/env bash

if [[ `pacman -Qi xorg-server > /dev/null 2>&1` ]]; then
    sudo pacman -S xorg
fi
if [[ `pacman -Qi xorg-xinit > /dev/null 2>&1` ]]; then
    sudo pacman -S xorg-xinit
fi
if [[ -f $HOME/.xinitrc ]]; then
    mv $HOME/.xinitrc $HOME/.xinitrc.old
fi
ln -sf $HOME/dotfiles/xorg/.xinitrc $HOME/.xinitrc
