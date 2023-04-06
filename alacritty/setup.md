## Setup

```
sudo pacman -S alacritty
mkdir ~/.config/alacritty
ln -s ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```

## Example shell script

```
if [[ `pacman -Qi alacritty > /dev/null 2>&1` ]]; then
    sudo pacman -S alacritty
fi

mkdir $HOME/.config/alacritty > /dev/null 2>&1
if [[ -f $HOME/.config/alacritty/alacritty.yml ]]; then
    mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.old
fi

ln -sf $HOME/dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
```
