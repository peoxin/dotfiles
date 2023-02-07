#!/usr/bin/env bash

sudo pacman -Syu > /dev/null

source install/install_xorg.sh 
source install/install_i3.sh 
source install/install_zsh.sh 
source install/install_clash.sh 
source install/install_git.sh 
