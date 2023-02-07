#!/usr/bin/env bash

if [[ `pacman -Qi i3-wm > /dev/null 2>&1` ]]; then
    sudo pacman -S i3-wm
fi
if [[ ! -d $HOME/.config/i3 ]]; then
    mkdir $HOME/.config/i3
fi
if [[ -f $HOME/.config/i3/config ]]; then
    mv $HOME/.config/i3/config $HOME/.config/i3/config.old
fi
ln -sf $HOME/dotfiles/i3/config $HOME/.config/i3/config
