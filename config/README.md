# Shared Configuration

This is the single linking guide for manually managed Arch Linux and macOS
machines. NixOS declares the same sources in
`systems/nixos/hosts/msi-desktop/home.nix`; do not run these commands there.

The checkout location is fixed at `~/dotfiles`. The commands below never
replace an existing file, directory or symbolic link. When a target is reported
as existing, inspect it and move or remove it manually before retrying.

Clone the repository first when the fixed checkout does not already exist:

```sh
git clone https://github.com/peoxin/dotfiles.git "$HOME/dotfiles"
```

## Local State

Keep credentials and machine-specific overrides outside version control:

- `~/.config/shell/local.sh` for Bash and Zsh environment variables.
- `~/.config/fish/local.fish` for Fish settings and environment variables.
- `~/.bashrc.local`, `~/.bash_profile.local`, `~/.zshrc.local` and
  `~/.zprofile.local` for shell overrides.
- `~/.config/hypr/monitor.conf` and `~/.config/hypr/input.conf` for host-specific
  display and input settings.
- `~/.gitconfig.local` for Git overrides.
- `~/.ssh/config.local` for additional SSH hosts and identities.

The previous Zsh module contained a committed API credential. It has been
removed from the working tree, but the credential must still be rotated because
it remains in Git history.

## Safe Link Helper

Run this definition once in the current Bash session:

```sh
repo="$HOME/dotfiles"

link_path() {
    if [ -e "$2" ] || [ -L "$2" ]; then
        printf 'Target already exists: %s\n' "$2" >&2
        return 1
    fi
    ln -s "$1" "$2"
}
```

## Shared Links

Create the real directories that must also hold local or generated files:

```sh
mkdir -p \
    "$HOME/.config/fish" \
    "$HOME/.config/qutebrowser" \
    "$HOME/.config/shell" \
    "$HOME/.config/yazi" \
    "$HOME/.local/bin" \
    "$HOME/.ssh"
```

Link home-directory files and the shared personal command:

```sh
link_path "$repo/config/bash/bashrc" "$HOME/.bashrc"
link_path "$repo/config/bash/bash_profile" "$HOME/.bash_profile"
link_path "$repo/config/zsh/env.zsh" "$HOME/.zshenv"
link_path "$repo/config/zsh/profile.zsh" "$HOME/.zprofile"
link_path "$repo/config/zsh/rc.zsh" "$HOME/.zshrc"
link_path "$repo/config/git/gitconfig-unix" "$HOME/.gitconfig"
link_path "$repo/config/git/gitmessage" "$HOME/.gitmessage"
link_path "$repo/config/tmux/tmux.conf" "$HOME/.tmux.conf"
link_path "$repo/config/ssh/config" "$HOME/.ssh/config"
link_path "$repo/bin/common/set-proxy" "$HOME/.local/bin/set-proxy"
```

Link complete application directories where the application does not need to
create sibling configuration files:

```sh
mkdir -p "$HOME/.config"
link_path "$repo/config/ghostty" "$HOME/.config/ghostty"
link_path "$repo/config/gitui" "$HOME/.config/gitui"
link_path "$repo/config/jj" "$HOME/.config/jj"
link_path "$repo/config/kitty" "$HOME/.config/kitty"
link_path "$repo/config/nvim" "$HOME/.config/nvim"
link_path "$repo/config/firefox" "$HOME/.config/tridactyl"
link_path "$repo/config/zellij" "$HOME/.config/zellij"
```

Link individual files into directories that also contain local settings,
downloaded themes or plugins:

```sh
link_path "$repo/config/shell/env.sh" "$HOME/.config/shell/env.sh"
link_path "$repo/config/fish/config.fish" "$HOME/.config/fish/config.fish"
link_path "$repo/config/starship/starship.toml" "$HOME/.config/starship.toml"
link_path "$repo/config/yazi/init.lua" "$HOME/.config/yazi/init.lua"
link_path "$repo/config/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"
link_path "$repo/config/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"
link_path "$repo/config/qutebrowser/config.py" "$HOME/.config/qutebrowser/config.py"
link_path "$repo/config/qutebrowser/userscripts" "$HOME/.config/qutebrowser/userscripts"
```

## Linux Desktop Links

Arch Linux also uses the following desktop configuration. NixOS declares these
links in Home Manager.

Create directories that mix tracked files with host-specific or application-
generated files:

```sh
mkdir -p "$HOME/.config/hypr" "$HOME/.config/fcitx5/conf" "$HOME/.local/bin"
```

Link complete application directories:

```sh
link_path "$repo/config/dunst" "$HOME/.config/dunst"
link_path "$repo/config/fontconfig" "$HOME/.config/fontconfig"
link_path "$repo/config/fuzzel" "$HOME/.config/fuzzel"
link_path "$repo/config/mpd" "$HOME/.config/mpd"
link_path "$repo/config/ncmpcpp" "$HOME/.config/ncmpcpp"
link_path "$repo/config/niri" "$HOME/.config/niri"
link_path "$repo/config/waybar" "$HOME/.config/waybar"
```

Keep Hyprland host overrides and Fcitx5-generated files beside these individual
links:

```sh
link_path "$repo/config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
link_path "$repo/config/hypr/hypridle.conf" "$HOME/.config/hypr/hypridle.conf"
link_path "$repo/config/hypr/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"
link_path "$repo/config/hypr/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"
link_path "$repo/config/fcitx5/config" "$HOME/.config/fcitx5/config"
link_path "$repo/config/fcitx5/profile" "$HOME/.config/fcitx5/profile"
link_path "$repo/config/fcitx5/conf/classicui.conf" "$HOME/.config/fcitx5/conf/classicui.conf"
link_path "$repo/config/fcitx5/conf/cloudpinyin.conf" "$HOME/.config/fcitx5/conf/cloudpinyin.conf"
link_path "$repo/config/fcitx5/conf/pinyin.conf" "$HOME/.config/fcitx5/conf/pinyin.conf"
```

Link the Linux personal commands individually so `~/.local/bin` can also hold
unrelated tools:

```sh
link_path "$repo/bin/linux/audio-control" "$HOME/.local/bin/audio-control"
link_path "$repo/bin/linux/audio-pactl" "$HOME/.local/bin/audio-pactl"
link_path "$repo/bin/linux/bluetooth-connect" "$HOME/.local/bin/bluetooth-connect"
link_path "$repo/bin/linux/clipboard-history" "$HOME/.local/bin/clipboard-history"
link_path "$repo/bin/linux/network-connect" "$HOME/.local/bin/network-connect"
link_path "$repo/bin/linux/power-control" "$HOME/.local/bin/power-control"
link_path "$repo/bin/linux/quick-command" "$HOME/.local/bin/quick-command"
link_path "$repo/bin/linux/screenshot" "$HOME/.local/bin/screenshot"
link_path "$repo/bin/linux/unmount-usb-device" "$HOME/.local/bin/unmount-usb-device"
link_path "$repo/bin/linux/wallpaper" "$HOME/.local/bin/wallpaper"
```

## Optional Plugins

These commands are for Arch Linux and macOS. Each clone fails without changing
the destination when that destination already exists.

### Zsh

```sh
mkdir -p "$HOME/.local/share/zsh/plugins"
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.local/share/oh-my-zsh"
git clone --depth 1 https://github.com/Aloxaf/fzf-tab.git "$HOME/.local/share/zsh/plugins/fzf-tab"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.local/share/zsh/plugins/zsh-autosuggestions"
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.local/share/zsh/plugins/zsh-syntax-highlighting"
```

### tmux

```sh
mkdir -p "$HOME/.tmux/plugins"
git clone --depth 1 https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
```

Start tmux and press `prefix + I` to install the plugins declared by
`~/.tmux.conf`.

### Yazi

```sh
ya pkg add yazi-rs/plugins:git
ya pkg add ndtoan96/ouch
```

### Fish

```sh
mkdir -p "$HOME/.local/share/fish/plugins"
git clone --depth 1 https://github.com/oh-my-fish/plugin-sudope.git "$HOME/.local/share/fish/plugins/sudope"
git clone --depth 1 https://github.com/shoriminimoe/fish-extract.git "$HOME/.local/share/fish/plugins/extract"

shopt -s nullglob
for plugin in "$HOME/.local/share/fish/plugins/"*; do
    for kind in functions completions conf.d; do
        for file in "$plugin/$kind/"*.fish; do
            [ -f "$file" ] || continue
            mkdir -p "$HOME/.config/fish/$kind"
            link_path "$file" "$HOME/.config/fish/$kind/$(basename "$file")"
        done
    done
done
shopt -u nullglob
```
