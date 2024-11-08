# Init oh-my-zsh if it is installed.
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(
        sudo
        extract
        zoxide
        fzf-tab
        zsh-autosuggestions
        fast-syntax-highlighting
    )
    source $ZSH/oh-my-zsh.sh
fi

# Alias for proxy setting script.
alias proxy="source $DOTFILES/scripts/set_proxy.sh"

# Aliases for git if it is installed.
if command -v git &> /dev/null; then
    alias gst="git status"
    alias glg="git log --date=iso --format='%C(yellow)%h %Creset- %C(cyan)%s %C(green)(%ad %an)'"
    alias gaa="git add ."
    alias gcm="git commit -m"
    alias gp="git push"
fi

# Aliases for z if it is installed.
if command -v z &> /dev/null; then
    alias cd="z"
fi

# Aliases for eza if it is installed.
if command -v eza &> /dev/null; then
    alias ls="eza"
    alias ll="eza -l"
    alias la="eza -la"
    alias l="eza -lah"
    alias tree="eza --tree"
fi

# Aliases for bat if it is installed.
if command -v bat &> /dev/null; then
    alias cat="bat"
fi

# Aliases for dust if it is installed.
if command -v dust &> /dev/null; then
    alias du="dust"
fi

# Aliases for fd if it is installed.
if command -v fd &> /dev/null; then
    alias find="fd"
fi

# Aliases for ripgrep if it is installed.
if command -v rg &> /dev/null; then
    alias grep="rg"
fi

# Aliases for delta if it is installed.
if command -v delta &> /dev/null; then
    alias diff="delta"
fi

# Aliases for bottom if it is installed.
if command -v btm &> /dev/null; then
    alias top="btm"
fi

# Aliases for procs if it is installed.
if command -v procs &> /dev/null; then
    alias ps="procs"
fi

# Aliases for kitty terminal if it is installed.
if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitten ssh"
    alias icat="kitten icat"
fi

# Alias for hyprland, if it is installed on Linux.
if [ "$(uname -s)" != "Darwin" ] && command -v hyprland &> /dev/null; then
    alias hl="hyprland"
fi

# Change the current working directory when exiting Yazi,
# use command `y` instead of `yazi` to enable this feature.
# See: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
if command -v yazi &> /dev/null; then
    function y {
    	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    	yazi "$@" --cwd-file="$tmp"
    	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    		builtin cd -- "$cwd"
    	fi
    	rm -f -- "$tmp"
    }
fi

# Make window decoration transparent for neovide on macOS.
if command -v neovide &> /dev/null; then
    if [ "$(uname -s)" = "Darwin" ]; then
        alias neovide="neovide --frame transparent &"
    else
        alias neovide="neovide &"
    fi
fi

# Init tmuxifier plugin for tmux if it is installed.
if [ -d "$HOME/.tmux/plugins/tmuxifier" ]; then
    export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
    eval "$(tmuxifier init -)"
fi

# Init starship prompt if it is installed.
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
