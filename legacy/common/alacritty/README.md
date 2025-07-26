# Alacritty

Install `alacritty`:

```
sudo pacman -S alacritty # on Arch Linux
brew install alacritty # on MacOS
```

Symlink the configuration file:

```
mkdir -p ~/.config/alacritty
ln -s $DOTFILES/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

Install `catppuccin` theme for `alacritty`:

```
cd ~/.config/alacritty
git clone https://github.com/catppuccin/alacritty.git catppuccin
mkdir themes && cp catppuccin/*.toml themes
```
