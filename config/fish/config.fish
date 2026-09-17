# Environment setup also applies to non-interactive Fish sessions.
fish_add_path --path "$HOME/.local/bin"
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
else if test -x /usr/local/bin/brew
    /usr/local/bin/brew shellenv fish | source
end
if type -q nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vi
end

# Private Fish settings use native syntax and stay outside the repository.
if test -f "$__fish_config_dir/local.fish"
    source "$__fish_config_dir/local.fish"
end
status is-interactive; or return

fish_vi_key_bindings
if type -q zoxide
    zoxide init fish | source
    alias cd z
end
if type -q starship
    starship init fish | source
end
if type -q direnv
    direnv hook fish | source
end

# Keep optional tools optional on manually managed machines.
for entry in 'cat bat' 'du dust' 'find fd' 'grep rg' 'diff delta' 'ps procs'
    set -l words (string split ' ' $entry)
    if type -q $words[2]
        alias $words[1] $words[2]
    end
end
if type -q btm
    alias top 'btm --basic'
end
if type -q eza
    alias ls eza
    alias ll 'eza -l'
    alias la 'eza -la'
    alias tree 'eza --tree'
end
alias gst 'git status'
alias glg "git log --date=iso --format='%C(yellow)%h %Creset%s %C(dim)%ad %an'"
alias ggraph 'git log --all --graph --oneline --decorate'
alias gaa 'git add .'
alias gcm 'git commit -m'
alias gp 'git push'
alias jst 'jj st'
alias jsh 'jj show'
alias jlg 'jj log'
alias hl hyprland

if type -q set-proxy
    alias proxy "exec bash -c 'source set-proxy on; exec fish'"
    alias noproxy "exec bash -c 'source set-proxy off; exec fish'"
end
if functions -q extract
    alias x extract
end

# Preserve the working directory selected in Yazi.
function y
    set -l cwd_file (mktemp -t yazi-cwd.XXXXXX)
    yazi $argv --cwd-file="$cwd_file"
    set -l cwd (command cat "$cwd_file")
    if test -n "$cwd"; and test "$cwd" != "$PWD"
        builtin cd -- "$cwd"
    end
    rm -f -- "$cwd_file"
end
