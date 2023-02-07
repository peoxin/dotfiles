#!/usr/bin/env bash

if [[ `pacman -Qi nvim > /dev/null 2>&1` ]]; then
    sudo pacman -S nvim
fi
if [[ `pacman -Qi ttf-nerd-fonts-symbols-common > /dev/null 2>&1` ]]; then
    sudo pacman -S ttf-nerd-fonts-symbols-common 
fi

if [[ -d $HOME/.config/nvim ]]; then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
fi
if [[ ! -d $HOME/.config/nvim ]]; then
    mkdir $HOME/.config/nvim
fi

ln -sf $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $HOME/dotfiles/nvim/lua $HOME/.config/nvim/lua
