## Setup

```
sudo pacman -S xorg
ln -s ~/dotfiles/xorg/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
ln -s ~/dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
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

ln -sf $HOME/dotfiles/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
ln -sf $HOME/dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```
