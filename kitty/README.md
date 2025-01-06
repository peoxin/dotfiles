# Kitty

Install `kitty`:

```
sudo pacman -S kitty # On Arch Linux
brew install --cask kitty # On MacOS
```

Symlink the configuration file:

```
mkdir -p ~/.config/kitty
ln -s $DOTFILES/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Install `catppuccin` theme for `kitty`:

```
kitten themes --dump-theme Catppuccin-Macchiato > ~/.config/kitty/Catppuccin-Macchiato.conf
```
