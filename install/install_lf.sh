#!/usr/bin/env bash

if [[ `pacman -Qi lf > /dev/null 2>&1` ]]; then
    sudo pacman -S lf
fi
if [[ `pacman -Qi perl-file-mimeinfo > /dev/null 2>&1` ]]; then
    sudo pacman -S perl-file-mimeinfo
fi
if [[ ! -d $HOME/.config/lf ]]; then
    mkdir $HOME/.config/lf
fi
if [[ -f $HOME/.config/lf/lfrc ]]; then
    mv $HOME/.config/lf/lfrc $HOME/.config/lf/lfrc.old
fi
ln -sf $HOME/dotfiles/lf/lfrc $HOME/.config/lf/lfrc
