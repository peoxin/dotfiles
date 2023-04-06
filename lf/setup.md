## Setup

```
sudo pacman -S lf perl-file-mimeinfo
mkdir ~/.config/lf
ln -s ~/dotfiles/lf/lfrc ~/.config/lf/lfrc
```

## Example shell script

```
if [[ `pacman -Qi lf > /dev/null 2>&1` ]]; then
    sudo pacman -S lf
fi
if [[ `pacman -Qi perl-file-mimeinfo > /dev/null 2>&1` ]]; then
    sudo pacman -S perl-file-mimeinfo
fi

mkdir $HOME/.config/lf > /dev/null 2>&1
if [[ -f $HOME/.config/lf/lfrc ]]; then
    mv $HOME/.config/lf/lfrc $HOME/.config/lf/lfrc.old
fi

ln -sf $HOME/dotfiles/lf/lfrc $HOME/.config/lf/lfrc
```
