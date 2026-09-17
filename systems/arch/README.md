# Arch Linux

Review each command and install only the groups needed on this machine. Package
and service management is intentionally manual.

## Base Tools

```sh
# Shells, version control, editors and terminal applications.
sudo pacman -S --needed bash zsh git git-delta jujutsu gitui neovim zellij starship yazi ouch

# Modern command-line tools.
sudo pacman -S --needed zoxide eza bat dust procs bottom ripgrep fd sd fzf jq just direnv mise
sudo pacman -S --needed curl wget aria2 zip unzip tar zstd xz gzip 7zip man-db less fastfetch watchexec
sudo pacman -S --needed tealdeer grex hexyl tokei hyperfine pastel imagemagick ffmpeg poppler resvg
```

## Development Tools

```sh
# Compilers, build systems and language tooling.
sudo pacman -S --needed base-devel cmake meson ninja clang rustup python uv nodejs npm ruff
```

## Desktop Applications

```sh
# Applications available in the official repositories.
sudo pacman -S --needed kitty ghostty firefox thunar zed obs-studio gimp inkscape imv mpv vlc qbittorrent obsidian

# Optional AUR applications; use yay instead of paru when preferred.
paru -S --needed zen-browser-bin wechat-bin wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts freetype2-wps
```

## Wayland Desktop

Choose one or both compositors, then install the shared desktop tools.

```sh
# Niri and its XWayland and portal integration.
sudo pacman -S --needed niri xwayland-satellite swaybg xdg-desktop-portal-gnome

# Hyprland and its portal, wallpaper, picker and policy-agent tools.
sudo pacman -S --needed hyprland xdg-desktop-portal-hyprland hyprpaper hyprpicker hyprpolkitagent

# Shared launchers, notifications, bars, clipboard and device tools.
sudo pacman -S --needed kitty fuzzel dunst waybar hypridle hyprlock wl-clipboard cliphist brightnessctl playerctl libnotify
sudo pacman -S --needed udisks2 udiskie bluez bluez-utils networkmanager grim slurp swappy

# Qt, input-method and Wayland integration.
sudo pacman -S --needed qt5-wayland qt6-wayland qt5ct qt6ct kvantum fcitx5-im fcitx5-chinese-addons

# Fonts used by the terminal and desktop configuration.
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-jetbrains-mono
```

Install `grimblast` from the AUR for the existing Hyprland screenshot bindings.
Choose and configure a display or login manager yourself. GTK/Qt themes and
Fcitx5 theme assets are also manual system choices.

## Services

```sh
# PipeWire audio and the user-session audio services.
sudo pacman -S --needed pipewire wireplumber pipewire-audio pipewire-pulse pipewire-alsa
systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service

# Networking and Bluetooth.
sudo systemctl enable --now NetworkManager bluetooth
```

## Virtualization

```sh
# QEMU/KVM and libvirt management tools.
sudo pacman -S --needed qemu-full virt-manager virt-viewer dnsmasq swtpm
sudo systemctl enable --now libvirtd.service
sudo usermod -aG libvirt "$(id -un)"
```

## User Directories

```sh
mkdir -p "$HOME/Desktop" "$HOME/Downloads" "$HOME/Documents" "$HOME/Pictures" "$HOME/Videos" "$HOME/Music" "$HOME/Projects"
```

## Configuration And Plugins

Follow the [shared configuration guide](../../config/README.md) for symlinks and
optional Zsh and Yazi plugins. Hyprland expects machine-local
`~/.config/hypr/monitor.conf` and `~/.config/hypr/input.conf`; create them before
starting Hyprland, even if they are empty.

## Updates

```sh
sudo pacman -Syu
```
