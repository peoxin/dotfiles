## Setup

```
sudo pacman -S hyprland hyprpaper
ln -s $DOTFILES/linux/hypr ~/.config/hypr
```

Install XDG desktop portal:

```
# Choose xdg-desktop-portal-gtk for implementation when installing
yay -S xdg-desktop-portal-hyprland-git
```

Install pipewire:

```
sudo pacman -S pipewire wireplumber
```

Install QT wayland support:

```
sudo pacman -S qt5-wayland qt6-wayland
```

## Useful Utilities in Wayland

Install clipboard manager `cliphist`:

```
sudo pacman -S wl-clipboard
go install go.senan.xyz/cliphist@latest
```

Install screen lock tool `swaylock`:

```
sudo pacman -S swaylock
```

Install backlight tool:

```
sudo pacman -S brightnessctl
```

Install screenshot tools:

```
sudo pacman -S grim slurp swappy
```

Install color picker tool `hyprpicker`:

```
yay -S hyprpicker-git
```

Install image viewer `imv`:

```
sudo pacman -S imv
```
