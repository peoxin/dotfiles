# Zsh

Install `zsh` on Arch Linux (default shell on MacOS):

```
sudo pacman -S zsh
```

Install `oh-my-zsh` and some plugins:

```
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Install fzf and zoxide
sudo pacman -S fzf zoxide # On Arch Linux
brew install fzf zoxide # On MacOS
```

Edit `~/.zprofile`:

```
# Change this environment variable to the path of your dotfiles.
export DOTFILES="$HOME/dotfiles"
source $DOTFILES/zsh/profile.zsh

# Set proxy (optional)
# source set-proxy on
```

Remove content generated by `oh-my-zsh` in `~/.zshrc`, and add the following:

```
source $DOTFILES/zsh/rc.zsh
```

Change your login shell to `zsh` on Linux:

```
chsh -s /usr/bin/zsh
```

Roload `zsh` configuration:

```
source ~/.zprofile
source ~/.zshrc
```
