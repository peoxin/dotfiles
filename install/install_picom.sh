#!/usr/bin/env bash

if [[ `pacman -Qi picom > /dev/null 2>&1` ]]; then
    sudo pacman -S picom
fi
if [[ ! -d $HOME/.config/picom ]]; then
    mkdir $HOME/.config/picom
fi
if [[ -f $HOME/.config/picom/picom.conf ]]; then
    mv $HOME/.config/picom/picom.conf $HOME/.config/picom/picom.conf.old
fi
ln -sf $HOME/dotfiles/picom/picom.conf $HOME/.config/picom/picom.conf
