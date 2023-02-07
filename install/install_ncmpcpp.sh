#!/usr/bin/env bash

if [[ `pacman -Qi ncmpcpp > /dev/null 2>&1` ]]; then
    sudo pacman -S ncmpcpp
fi
if [[ ! -d $HOME/.config/ncmpcpp ]]; then
    mkdir $HOME/.config/ncmpcpp
fi
if [[ -f $HOME/.config/ncmpcpp/config ]]; then
    mv $HOME/.config/ncmpcpp/config $HOME/.config/ncmpcpp/config.old
fi
ln -sf $HOME/dotfiles/ncmpcpp/config $HOME/.config/ncmpcpp/config
