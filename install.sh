#!/usr/bin/env bash

if [[ ! -d $HOME/.config ]]; then
    mkdir $HOME/.config
fi

cd $HOME/dotfiles/install
for install_script in `ls $HOME/dotfiles/install`; do
    echo ${install_script}
    source ${install_script}
done
