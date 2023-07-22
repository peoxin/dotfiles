## Setup

```
sudo pacman -S xorg
ln -s ~/dotfiles/xorg/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
ln -s ~/dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```
