export PATH="$HOME/.local/bin:$PATH"

if [ "$(uname -s)" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
fi

# Editor for local and remote sessions.
if [ -n $SSH_CONNECTION ]; then
    export EDITOR="nvim"
else
    export EDITOR="nvim"
fi
