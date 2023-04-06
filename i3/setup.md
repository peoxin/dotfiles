## Setup

```
sudo pacman -S i3-wm
mkdir ~/.config/i3
ln -s ~/dotfiles/i3/config ~/.config/i3/config
```

## Example shell script

```
if [[ `pacman -Qi i3-wm > /dev/null 2>&1` ]]; then
    sudo pacman -S i3-wm
fi

mkdir $HOME/.config/i3 > /dev/null 2>&1
if [[ -f $HOME/.config/i3/config ]]; then
    mv $HOME/.config/i3/config $HOME/.config/i3/config.old
fi

ln -sf $HOME/dotfiles/i3/config $HOME/.config/i3/config
```
