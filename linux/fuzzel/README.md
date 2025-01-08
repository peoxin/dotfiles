# Fuzzel

Install `fuzzel`:

```
sudo pacman -S fuzzel
```

Symlink the configuration:

```
mkdir -p ~/.config/fuzzel
ln -s $DOTFILES/linux/fuzzel/fuzzel.ini ~/.config/fuzzel/fuzzel.ini
```

Install `catppuccin` themes:

```
cd ~/.config/fuzzel
git clone https://github.com/catppuccin/fuzzel.git catppuccin
mv catppuccin/themes themes && rm -rf catppuccin
```
