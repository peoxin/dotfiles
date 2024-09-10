# Setup

Install `zsh` and some plugins:

```
# Use brew instead of pacman on macos
sudo pacman -S zsh

# Install oh-my-zsh and zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
sudo pacman -S fzf zoxide

# Install additional zsh themes (choose one)
# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Starship
brew install starship # macos
pacman -S starship # arch linux
```

Edit `~/.zprofile`:

```
export DOTFILES="$HOME/dotfiles" # Or other directory where your dotfiles are located
source $DOTFILES/zsh/env_linux.zsh # Or env_macos.zsh based on your platform
```

Source configuration files in `~/.zshrc`:

```
source $DOTFILES/zsh/config.zsh
```

Change your login shell:

```
chsh -s /usr/bin/zsh
```
