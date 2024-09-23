# GitUI

Install `gitui`:

```
sudo pacman -S gitui # on Arch Linux
brew install gitui # on MacOS
```

Symlink the keybindings file:

```
mkdir -p ~/.config/gitui
ln -s $DOTFILES/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron
```

Install `catppuccin` theme for `gitui`:

```
cd ~/.config/gitui
git clone https://github.com/catppuccin/gitui.git
cp gitui/themes/catppuccin-macchiato.ron theme.ron
```
