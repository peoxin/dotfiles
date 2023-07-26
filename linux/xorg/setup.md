## Setup

```
sudo pacman -S xorg
ln -s $DOTFILES/linux/xorg/.xinitrc ~/.xinitrc
ln -s $DOTFILES/linux/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
ln -s $DOTFILES/linux/xorg/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```
