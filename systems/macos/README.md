# macOS

Install Homebrew, review every package group, and run only the commands wanted
on this machine. Nothing in this repository invokes these commands
automatically.

## Developer Tools And Homebrew

```sh
# Request Apple's command-line developer tools.
xcode-select --install
```

Install Homebrew from its official instructions, enable `brew shellenv`, then
add the tap used by `macism`:

```sh
brew tap laishulu/homebrew
```

## Command-Line Packages

```sh
# Shell and version-control tools.
brew install zsh
brew install git git-delta jj gitui

# Editors, terminal workspaces and file navigation.
brew install neovim zellij herdr yazi ouch

# Prompt, directory and file inspection tools.
brew install starship zoxide eza bat fd dust procs bottom sd ripgrep

# Interactive shell and project tools.
brew install fastfetch mise fzf just watchexec jq direnv

# Documentation, search and benchmarking tools.
brew install tealdeer grex hexyl tokei hyperfine pastel

# Download and archive utilities.
brew install curl wget less sevenzip zstd xz

# Media and document tools.
brew install imagemagick ffmpeg poppler resvg pandoc typst hugo

# Compilers, build systems and language tooling.
brew install uv rustup cmake meson ninja llvm node python ruff

# Agent and input-source tools.
brew install opencode pi-coding-agent macism
```

Run `rustup default stable` when a default Rust toolchain is wanted.

## Desktop Applications

```sh
# Terminals and browsers.
brew install --cask ghostty kitty firefox zen

# Editors, productivity and window utilities.
brew install --cask zed raycast obsidian typora mos pixpin

# Media and creative applications.
brew install --cask vlc gimp inkscape

# Downloads, archives, networking.
brew install --cask qbittorrent qlmarkdown the-unarchiver clash-verge-rev

# Coding agent.
brew install --cask claude-code codex
```

## Fonts

```sh
# CJK, symbol and programming fonts used by the shared configuration.
brew install --cask font-noto-sans-cjk-sc font-noto-serif-cjk-sc
brew install --cask font-symbols-only-nerd-font font-jetbrains-mono font-maple-mono-cn
```

## Configuration And Plugins

Follow the [shared configuration guide](../../config/README.md) for all symlinks
and optional Zsh and Yazi plugins.

The shared Zsh profile detects Homebrew in both `/opt/homebrew` and `/usr/local`
on the next login. When migrating from a Nix-managed Mac, clear an inherited
`ZDOTDIR` that still points to an old Home Manager directory before opening the
new shell configuration.


## Checks And Updates

```sh
# Inspect installed packages and outdated entries.
brew list
brew outdated

# Refresh Homebrew and upgrade installed packages explicitly.
brew update
brew upgrade
brew upgrade --cask
```
