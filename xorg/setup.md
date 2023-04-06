## Setup

```
sudo pacman -S xorg
ln -s ~/dotfiles/xorg/.xinitrc ~/.xinitrc
```

## Example shell script

```
if [[ `pacman -Qi xorg-server > /dev/null 2>&1` ]]; then
    sudo pacman -S xorg
fi

if [[ -f $HOME/.xinitrc ]]; then
    mv $HOME/.xinitrc $HOME/.xinitrc.old
fi

ln -sf $HOME/dotfiles/xorg/.xinitrc $HOME/.xinitrc
```
