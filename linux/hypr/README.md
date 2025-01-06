# Hyprland

Before installing Hyprland, make sure you have terminal emulator and basic fonts installed:

```
sudo pacman -S kitty noto-fonts
```

Install the following packages:

```
# Hyprland and essential tools
sudo pacman -S hyprland xdg-desktop-portal-hyprland pipewire wireplumber qt5-wayland qt6-wayland
paru -S hyprpolkitagent

# Idle manager and screen locker
sudo pacman -S hypridle hyprlock

# Wallpaper utility
sudo pacman -S hyprpaper

# Color picker
sudo pacman -S hyprpicker
```

Symlink the configuration files:

```
rm -rf ~/.config/hypr && ln -s $DOTFILES/linux/hypr ~/.config/hypr
```
