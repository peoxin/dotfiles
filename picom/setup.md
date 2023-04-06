## Setup

```
sudo pacman -S picom
mkdir ~/.config/picom
ln -s ~/dotfiles/picom/picom.conf ~/.config/picom/picom.conf
```

## Example shell script

```
if [[ `pacman -Qi picom > /dev/null 2>&1` ]]; then
    sudo pacman -S picom
fi

mkdir $HOME/.config/picom > /dev/null 2>&1
if [[ -f $HOME/.config/picom/picom.conf ]]; then
    mv $HOME/.config/picom/picom.conf $HOME/.config/picom/picom.conf.old
fi

ln -sf $HOME/dotfiles/picom/picom.conf $HOME/.config/picom/picom.conf
```
