#!/usr/bin/env bash

if [[ `pacman -Qi git > /dev/null 2>&1` ]]; then
    sudo pacman -S git
fi
if [[ `pacman -Qi openssh > /dev/null 2>&1` ]]; then
    sudo pacman -S openssh
fi
git config --global user.name "peoxin"
git config --global user.email "1610860309@qq.com"

# Generate ssh key (Careful)
# ssh-keygen -t rsa -C "1610860309@qq.com"
