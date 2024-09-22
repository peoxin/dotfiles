# Kitty

Install `kitty` (update `kitty` with the same command):

```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

Symlink configuration file:

```
mkdir -p ~/.config/kitty
ln -s $DOTFILES/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Install `catppuccin` theme for `kitty`:

```
cd ~/.config/kitty
git clone https://github.com/catppuccin/kitty.git
mkdir themes && cp kitty/themes/* themes
```
