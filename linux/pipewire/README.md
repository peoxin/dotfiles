# Pipewire

Install `pipewire` and related packages:

```
sudo pacman -S pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire lib32-pipewire-jack
sudo pacman -S noise-suppression-for-voice
```

Symlink the `pipewire` configuration files:

```
ln -s $DOTFILES/linux/pipewire ~/.config/pipewire
```

Enable and start the `pipewire` service:

```
systemctl enable --now --user pipewire
systemctl enable --now --user pipewire-pulse
```
