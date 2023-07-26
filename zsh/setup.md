## Setup

Install `zsh` and some plugins:

```
# Use brew instead of pacman in macos
sudo pacman -S zsh

# Install oh-my-zsh and zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo pacman -S fzf zoxide
```

Edit `~/.zprofile`:

```
export DOTFILES="$HOME/dotfiles" # Or other directory where your dotfiles are located
source $DOTFILES/zsh/env_linux.zsh # Or env_macos.zsh based on your platform
```

Edit `~/.zshrc` and source configuration files in the middle of your `.zshrc`:

```
source $DOTFILES/zsh/config.zsh
```

Change your login shell:

```
chsh -s /usr/bin/zsh
```
