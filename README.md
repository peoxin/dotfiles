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

### Touchpad

Add the following contents in `/etc/X11/xorg.conf.d/30-touchpad.conf`:

```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```
