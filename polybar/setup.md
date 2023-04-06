## Setup

```
sudo pacman -S polybar
mkdir ~/.config/polybar
ln -s ~/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
```

## Example shell script

```
if [[ `pacman -Qi polybar > /dev/null 2>&1` ]]; then
    sudo pacman -S polybar
fi

mkdir $HOME/.config/polybar > /dev/null 2>&1
if [[ -f $HOME/.config/polybar/config.ini ]]; then
    mv $HOME/.config/polybar/config.ini $HOME/.config/polybar/config.ini.old
fi

ln -sf $HOME/dotfiles/polybar/config.ini $HOME/.config/polybar/config.ini
```
