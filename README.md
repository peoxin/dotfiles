# dotfiles

已有配置包括：

- zsh
- xorg
- i3
- polybar
- nvim
- lf
- rofi
- picom
- alacritty
- mpd & ncmpcpp
- dunst
- latte-dock

安装方法：`sh install.sh`

## 额外配置

### 字体

- noto-fonts
- noto-fonts-cjk
- ttf-noto-nerd
- adobe-source-code-pro-fonts

### 输入法主题

- fcitx5-nord

### Pulseaudio

在 `/etc/pulse/client.conf` 文件中，需要设置 `autospawn = yes`。

### Touchpad

在 `/etc/X11/xorg.conf.d/30-touchpad.conf` 文件中，添加：

```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```
