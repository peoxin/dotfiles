## Setup

```
sudo pacman -S nvim
mkdir ~/.config/nvim
ln -s ~/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/lua $HOME/.config/nvim/lua
```

## Example shell script

```
if [[ `pacman -Qi nvim > /dev/null 2>&1` ]]; then
    sudo pacman -S nvim
fi

if [[ -d $HOME/.config/nvim ]]; then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
fi
mkdir $HOME/.config/nvim > /dev/null 2>&1

ln -sf $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $HOME/dotfiles/nvim/lua $HOME/.config/nvim/lua
```
