Please edit `.gitconfig` to use your own name and email!

## Setup

```
sudo pacman -S git openssh
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

# Generate ssh key
# ssh-keygen -t rsa -C comment
```

## Example shell script

```
if [[ `pacman -Qi git > /dev/null 2>&1` ]]; then
    sudo pacman -S git
fi
if [[ `pacman -Qi openssh > /dev/null 2>&1` ]]; then
    sudo pacman -S openssh
fi

if [[ -f $HOME/.gitconfig ]]; then
    mv $HOME/.gitconfig $HOME/.gitconfig.old
fi

ln -sf $HOME/dotfiles/git/.gitconfig $HOME/.gitconfig
```
