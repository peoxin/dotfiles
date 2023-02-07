#!/usr/bin/env bash

if [[ `pacman -Qi clash > /dev/null 2>&1` ]]; then
    sudo pacman -S clash
fi
if [[ ! -d $HOME/.config/clash ]]; then
    mkdir $HOME/.config/clash
fi
curl -o $HOME/.config/clash/Country.mmdb http://www.ideame.top/mmdb/Country.mmdb
