## Setup

```
sudo pacman -S dunst
mkdir ~/.config/dunst
ln -s ~/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
```

## Example shell script

```
if [[ `pacman -Qi dunst > /dev/null 2>&1` ]]; then
    sudo pacman -S dunst
fi

mkdir $HOME/.config/dunst > /dev/null 2>&1
if [[ -f $HOME/.config/dunst/dunstrc ]]; then
    mv $HOME/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc.old
fi

ln -sf $HOME/dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc
```
