## Setup

```
sudo pacman -S mpd
mkdir ~/.config/mpd
ln -s ~/dotfiles/mpd/mpd.conf ~/.config/mpd/mpd.conf
```

## Example shell script

```
if [[ `pacman -Qi mpd > /dev/null 2>&1` ]]; then
    sudo pacman -S mpd
fi

mkdir $HOME/.config/mpd > /dev/null 2>&1
if [[ -f $HOME/.config/mpd/mpd.conf ]]; then
    mv $HOME/.config/mpd/mpd.conf $HOME/.config/mpd/mpd.conf.old
fi

ln -sf $HOME/dotfiles/mpd/mpd.conf $HOME/.config/mpd/mpd.conf
```
