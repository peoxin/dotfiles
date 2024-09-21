# Neovim

Install `neovim`:
```
sudo pacman -S nvim # on Arch Linux
brew install neovim # on MacOS
```

Install command line tools needed by some plugins:
```
sudo pacman -S ripgrep fd fzf # on Arch Linux
brew install ripgrep fd fzf # on MacOS
```

Symlink the configuration files:
```
mkdir -p ~/.config/nvim
ln -s $DOTFILES/nvim/lua ~/.config/nvim/lua
ln -s $DOTFILES/nvim/init.lua ~/.config/nvim/init.lua
```
