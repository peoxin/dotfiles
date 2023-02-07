#!/usr/bin/env bash

if [[ ! -d $HOME/.config/fontconfig ]]; then
    mkdir $HOME/.config/fontconfig
fi
if [[ -f $HOME/.config/fontconfig/fonts.conf ]]; then
    mv $HOME/.config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf.old
fi
ln -sf $HOME/dotfiles/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
