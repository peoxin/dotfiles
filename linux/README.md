## Additional Configurations

### Fonts

- noto-fonts
- noto-fonts-cjk
- ttf-noto-nerd

Suggested coding fonts:

- adobe-source-code-pro-fonts
- ttf-meslo-nerd
- ttf-hack
- ttf-input
- ttf-dejavu
- ttf-droid

### Fcitx5 Themes

- catppuccin/fcitx5
- tonyfettes/fcitx5-nord
- Reverier-Xu/FluentDark-fcitx5

### Pulseaudio

Set `autospawn = yes` in `/etc/pulse/client.conf` file.

## Tools

### Trash Management

```
sudo pacman -S trash-cli
```

### Auto Mount

```
sudo pacman -S udisks2 udiskie
```

Remember to start `udiskie` before you plug in your device.

### Media Player Control

```
sudo pacman -S playerctl
```

### Clash

```
sudo pacman -S clash
mkdir -p ~/.config/clash
curl -o ~/.config/clash/Country.mmdb https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/Country.mmdb
```

Clash configuration file path: `~/.config/clash/config.yaml`

Clash dashboard: `https://clash.razord.top`

More info about `Country.mmdb`, see [Loyalsoldier/geoip](https://github.com/Loyalsoldier/geoip).

If all proxy servers are timed out, check and sync your system time. In Arch Linux, remember to enable:

```
timedatectl set-ntp true
```
