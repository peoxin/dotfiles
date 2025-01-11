# Yazi

Install the required plugins:

```
ya pack -a yazi-rs/plugins:git
ya pack -a yazi-rs/plugins:max-preview
ya pack -a KKV9/compress
```

Symlink the configuration files:

```
ln -s $DOTFILES/yazi/init.lua ~/.config/yazi/init.lua
ln -s $DOTFILES/yazi/yazi.toml ~/.config/yazi/yazi.toml
ln -s $DOTFILES/yazi/keymap.toml ~/.config/yazi/keymap.toml
```

Install the `catppuccin` theme:

```
cd ~/.config/yazi
wget https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/macchiato/catppuccin-macchiato-blue.toml -O theme.toml
wget https://github.com/catppuccin/bat/blob/main/themes/Catppuccin%20Macchiato.tmTheme
```
