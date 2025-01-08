# Mpd

Install `mpd`:

```
sudo pacman -S mpd
```

Symlink the configuration:

```
ln -s $DOTFILES/linux/mpd ~/.config/mpd
```

Create specified directories:

```
mkdir -p ~/.mpd/playlists
```

Enable and start system service:

```
systemctl enable --now mpd --user
```
