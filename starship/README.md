# Starship

Install `starship` prompt:
```
sudo pacman -S starship # On Arch Linux
brew install starship # On MacOS
```

Add the following to the end of `~/.zshrc` to activate `starship`:
```
eval "$(starship init zsh)"
```

Soft link the `starship` configuration file:
```
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml
```
