# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="eastwood"
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    sudo
    extract
    zoxide
    zsh-autosuggestions
    fast-syntax-highlighting
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set aliases
alias cd="z"

alias gst="git status"
alias glg="git log --date=iso --format='%C(yellow)%h %Creset- %C(cyan)%s %C(green)(%ad %an)'"
alias gaa="git add ."
alias gcm="git commit -m"
alias gp="git push"

alias lgit="lazygit"
alias gitui="gitui -t mocha.ron"

alias hl="Hyprland"

# Init starship prompt
eval "$(starship init zsh)"
