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

Install theme for `kitty`.
Run the following command and select the theme, and choose to place the theme file into kitty configuration directory:

```
kitty +kitten themes
```
