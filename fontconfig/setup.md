## Setup

```
mkdir ~/.config/fontconfig
ln -s ~/dotfiles/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
```

## Example shell script

```
mkdir $HOME/.config/fontconfig > /dev/null 2>&1
if [[ -f $HOME/.config/fontconfig/fonts.conf ]]; then
    mv $HOME/.config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf.old
fi

ln -sf $HOME/dotfiles/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
```
