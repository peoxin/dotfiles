# dotfiles

## Usage

You can use this configuration following the instructions in `setup.md` file in each folder.

## Additional configurations

### Fonts

- noto-fonts
- noto-fonts-cjk
- ttf-noto-nerd
- adobe-source-code-pro-fonts

### Fcitx5 theme

- fcitx5-nord

### Pulseaudio

Set `autospawn = yes` in `/etc/pulse/client.conf` file.

### Auto mount

```
sudo pacman -S udisks2 udiskie
```

Run `udiskie`.

### Image viewer

```
sudo pacman -S imv
```

### Media player control

```
sudo pacman -S playerctl
```
