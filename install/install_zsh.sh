#!/usr/bin/env bash

if [[ `pacman -Qi zsh > /dev/null 2>&1` ]]; then
    sudo pacman -S zsh
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [[ -f $HOME/.zprofile ]]; then
    mv $HOME/.zprofile $HOME/.zprofile.old
fi
if [[ -f $HOME/.zshrc ]]; then
    mv $HOME/.zshrc $HOME/.zshrc.old
fi
ln -sf $HOME/dotfiles/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
chsh -s /usr/bin/zsh
