# Shared Configuration

This is the single configuration guide for Arch Linux, macOS and NixOS.
The repository location is fixed at `~/dotfiles` on manually managed systems
and `/home/peoxin/dotfiles` on NixOS.

Clone the repository first when the fixed checkout does not already exist:

```sh
git clone https://github.com/peoxin/dotfiles.git "$HOME/dotfiles"
```

## Zsh Wrapper Files

Keep `~/.zshenv`, `~/.zprofile` and `~/.zshrc` as regular, manually managed
files. Source the matching repository file first, then place machine-specific
settings below it so they can override the shared defaults.

Add this to `~/.zshenv`:

```zsh
[[ -r "$HOME/dotfiles/config/zsh/env.zsh" ]] && source "$HOME/dotfiles/config/zsh/env.zsh"

# Machine-specific environment settings follow.
```

Add this to `~/.zprofile`:

```zsh
[[ -r "$HOME/dotfiles/config/zsh/profile.zsh" ]] && source "$HOME/dotfiles/config/zsh/profile.zsh"

# Machine-specific login settings follow.
```

Add this to `~/.zshrc`:

```zsh
[[ -r "$HOME/dotfiles/config/zsh/rc.zsh" ]] && source "$HOME/dotfiles/config/zsh/rc.zsh"

# Machine-specific interactive settings follow.
```

Do not symlink these wrapper files. Software may still rewrite a wrapper, but
the shared files in the repository remain protected; restore the source line
manually if that happens.

## Symbolic Links

The commands below never remove or replace an existing target. Before running
a command, make sure its target does not exist. In particular, `ln -s` may
create a nested link when the target is already a directory, so inspect and
move or remove conflicts manually.

The link tables are for Arch Linux and macOS. NixOS declares the same links
directly in `systems/nixos/hosts/msi-desktop/home.nix`; do not run these link
commands there.

### Shared Links

Create the parent directories and the real directories that also contain
machine-local or generated files:

```sh
mkdir -p "$HOME/.config" "$HOME/.config/jj" "$HOME/.config/yazi" "$HOME/.local/bin" "$HOME/.ssh"
```

| Software | Command |
| --- | --- |
| Git | `ln -s "$HOME/dotfiles/config/git/gitconfig-unix" "$HOME/.gitconfig"`<br>`ln -s "$HOME/dotfiles/config/git/gitmessage" "$HOME/.gitmessage"` |
| SSH | `ln -s "$HOME/dotfiles/config/ssh/config" "$HOME/.ssh/config"` |
| Ghostty | `ln -s "$HOME/dotfiles/config/ghostty" "$HOME/.config/ghostty"` |
| GitUI | `ln -s "$HOME/dotfiles/config/gitui" "$HOME/.config/gitui"` |
| Jujutsu | `ln -s "$HOME/dotfiles/config/jj/config.toml" "$HOME/.config/jj/config.toml"` |
| Kitty | `ln -s "$HOME/dotfiles/config/kitty" "$HOME/.config/kitty"` |
| Neovim | `ln -s "$HOME/dotfiles/config/nvim" "$HOME/.config/nvim"` |
| Starship | `ln -s "$HOME/dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"` |
| Yazi | `ln -s "$HOME/dotfiles/config/yazi/init.lua" "$HOME/.config/yazi/init.lua"`<br>`ln -s "$HOME/dotfiles/config/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"`<br>`ln -s "$HOME/dotfiles/config/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"` |
| Zellij | `ln -s "$HOME/dotfiles/config/zellij" "$HOME/.config/zellij"` |
| set-proxy | `ln -s "$HOME/dotfiles/commands/common/set-proxy" "$HOME/.local/bin/set-proxy"` |

### Linux Desktop Links

Create the real directories that also contain host-specific or generated
files:

```sh
mkdir -p "$HOME/.config/hypr" "$HOME/.config/fcitx5/conf" "$HOME/.local/bin"
```

| Software | Command |
| --- | --- |
| Dunst | `ln -s "$HOME/dotfiles/config/dunst" "$HOME/.config/dunst"` |
| Fontconfig | `ln -s "$HOME/dotfiles/config/fontconfig" "$HOME/.config/fontconfig"` |
| Fuzzel | `ln -s "$HOME/dotfiles/config/fuzzel" "$HOME/.config/fuzzel"` |
| Niri | `ln -s "$HOME/dotfiles/config/niri" "$HOME/.config/niri"` |
| Waybar | `ln -s "$HOME/dotfiles/config/waybar" "$HOME/.config/waybar"` |
| Hyprland | `ln -s "$HOME/dotfiles/config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"`<br>`ln -s "$HOME/dotfiles/config/hypr/hypridle.conf" "$HOME/.config/hypr/hypridle.conf"`<br>`ln -s "$HOME/dotfiles/config/hypr/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"`<br>`ln -s "$HOME/dotfiles/config/hypr/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"` |
| Fcitx5 | `ln -s "$HOME/dotfiles/config/fcitx5/config" "$HOME/.config/fcitx5/config"`<br>`ln -s "$HOME/dotfiles/config/fcitx5/profile" "$HOME/.config/fcitx5/profile"`<br>`ln -s "$HOME/dotfiles/config/fcitx5/conf/classicui.conf" "$HOME/.config/fcitx5/conf/classicui.conf"`<br>`ln -s "$HOME/dotfiles/config/fcitx5/conf/cloudpinyin.conf" "$HOME/.config/fcitx5/conf/cloudpinyin.conf"`<br>`ln -s "$HOME/dotfiles/config/fcitx5/conf/pinyin.conf" "$HOME/.config/fcitx5/conf/pinyin.conf"` |
| Personal commands | `ln -s "$HOME/dotfiles/commands/linux/audio-control" "$HOME/.local/bin/audio-control"`<br>`ln -s "$HOME/dotfiles/commands/linux/audio-pactl" "$HOME/.local/bin/audio-pactl"`<br>`ln -s "$HOME/dotfiles/commands/linux/bluetooth-connect" "$HOME/.local/bin/bluetooth-connect"`<br>`ln -s "$HOME/dotfiles/commands/linux/clipboard-history" "$HOME/.local/bin/clipboard-history"`<br>`ln -s "$HOME/dotfiles/commands/linux/network-connect" "$HOME/.local/bin/network-connect"`<br>`ln -s "$HOME/dotfiles/commands/linux/power-control" "$HOME/.local/bin/power-control"`<br>`ln -s "$HOME/dotfiles/commands/linux/quick-command" "$HOME/.local/bin/quick-command"`<br>`ln -s "$HOME/dotfiles/commands/linux/screenshot" "$HOME/.local/bin/screenshot"`<br>`ln -s "$HOME/dotfiles/commands/linux/unmount-usb-device" "$HOME/.local/bin/unmount-usb-device"`<br>`ln -s "$HOME/dotfiles/commands/linux/wallpaper" "$HOME/.local/bin/wallpaper"` |

Keep `~/.config/hypr/monitor.conf` and `~/.config/hypr/input.conf` as
machine-specific files.

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

### Yazi

```sh
ya pkg add yazi-rs/plugins:git
ya pkg add ndtoan96/ouch
```

## Local State

Keep credentials and machine-specific settings outside version control:

- `~/.zshenv`, `~/.zprofile` and `~/.zshrc` for shell settings.
- `~/.config/hypr/monitor.conf` and `~/.config/hypr/input.conf` for display and
  input settings.
- `~/.gitconfig.local` for Git overrides.
- `~/.ssh/config.local` for additional SSH hosts and identities.

The previous Zsh module contained a committed API credential. It has been
removed from the working tree, but the credential must still be rotated because
it remains in Git history.
