# Kitty

Install `kitty` (update `kitty` with the same command):

```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
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
