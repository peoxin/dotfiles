if [ "$(uname -s)" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
else
    source $DOTFILES/linux/scripts/set_proxy.sh on

    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi

# Preferred editor for local and remote sessions.
if [ -n $SSH_CONNECTION ]; then
    export EDITOR="nvim"
else
    export EDITOR="nvim"
fi
