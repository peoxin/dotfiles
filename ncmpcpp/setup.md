## Setup

```
sudo pacman -S ncmpcpp
mkdir ~/.config/ncmpcpp
ln -s ~/dotfiles/ncmpcpp/config ~/.config/ncmpcpp/config
```

## Example shell script

```
if [[ `pacman -Qi ncmpcpp > /dev/null 2>&1` ]]; then
    sudo pacman -S ncmpcpp
fi

mkdir $HOME/.config/ncmpcpp > /dev/null 2>&1
if [[ -f $HOME/.config/ncmpcpp/config ]]; then
    mv $HOME/.config/ncmpcpp/config $HOME/.config/ncmpcpp/config.old
fi

ln -sf $HOME/dotfiles/ncmpcpp/config $HOME/.config/ncmpcpp/config
```
