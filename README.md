# dotfiles

## Usage

The location of the configuration folder should be `~/dotfiles`. Thus, you can run this command:

```
cd && git clone https://github.com/peoxin/dotfiles.git
```

Follow the instructions in `setup.md` file in each folder to setup.

## Additional configurations

### Fonts

- noto-fonts
- noto-fonts-cjk
- ttf-noto-nerd
- adobe-source-code-pro-fonts

### Fcitx5 theme

- catppuccin/fcitx5
- tonyfettes/fcitx5-nord
- Reverier-Xu/FluentDark-fcitx5

### Pulseaudio

Set `autospawn = yes` in `/etc/pulse/client.conf` file.

## Tools

### Trash management

```
sudo pacman -S trash-cli
```

### Auto mount

```
sudo pacman -S udisks2 udiskie
```

Remember to start `udiskie` before you plug in your device.

### Media player control

```
sudo pacman -S playerctl
```

### Clash

```
sudo pacman -S clash
mkdir ~/.config/clash
curl -o ~/.config/clash/Country.mmdb https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/Country.mmdb
```

Clash configuration file path: `~/.config/clash/config.yaml`

Clash dashboard: `https://clash.razord.top`

More info about `Country.mmdb`, see [Loyalsoldier/geoip](https://github.com/Loyalsoldier/geoip).

If all proxy servers are timed out, check and sync your system time. In Arch, remember to enable:

```
timedatectl set-ntp true
```
