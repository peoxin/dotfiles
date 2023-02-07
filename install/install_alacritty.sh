#!/usr/bin/env bash

if [[ `pacman -Qi alacritty > /dev/null 2>&1` ]]; then
    sudo pacman -S alacritty
fi
if [[ ! -d $HOME/.config/alacritty ]]; then
    mkdir $HOME/.config/alacritty
fi
if [[ -f $HOME/.config/alacritty/alacritty.yml ]]; then
    mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.old
fi
ln -sf $HOME/dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
