## Setup

```
sudo pacman -S rofi
mkdir ~/.config/rofi
ln -s ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```

## Example shell script

```
if [[ `pacman -Qi rofi > /dev/null 2>&1` ]]; then
    sudo pacman -S rofi
fi

mkdir $HOME/.config/rofi > /dev/null 2>&1
if [[ -f $HOME/.config/rofi/config.rasi ]]; then
    mv $HOME/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi.old
fi

ln -sf $HOME/dotfiles/rofi/config.rasi $HOME/.config/rofi/config.rasi
```
