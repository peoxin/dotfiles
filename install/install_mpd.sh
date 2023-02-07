#!/usr/bin/env bash

if [[ `pacman -Qi mpd > /dev/null 2>&1` ]]; then
    sudo pacman -S mpd
fi
if [[ ! -d $HOME/.config/mpd ]]; then
    mkdir $HOME/.config/mpd
fi
if [[ -f $HOME/.config/mpd/mpd.conf ]]; then
    mv $HOME/.config/mpd/mpd.conf $HOME/.config/mpd/mpd.conf.old
fi
ln -sf $HOME/dotfiles/mpd/mpd.conf $HOME/.config/mpd/mpd.conf
