# Setup

Install `starship`:
```
pacman -S starship # arch linux
brew install starship # macos
```

Add the following to the end of `~/.zshrc` to activate `starship`:
```
eval "$(starship init zsh)"
```

Soft link the `starship` configuration file:
```
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml
```
