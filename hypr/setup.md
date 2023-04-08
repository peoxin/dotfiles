## Setup

```
yay -S hyprland-git
sudo pacman -S hyprpaper

mkdir ~/.config/hypr
ln -s ~/dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -s ~/dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
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

## Useful utilities in wayland

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
