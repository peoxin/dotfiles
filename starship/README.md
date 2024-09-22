# Starship

Install `starship` prompt:
```
sudo pacman -S starship # on Arch Linux
brew install starship # on MacOS
```

Add the following to the end of `~/.zshrc` to activate `starship`:
```
eval "$(starship init zsh)"
```

Symlink the configuration file (if exists):
```
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml
```
