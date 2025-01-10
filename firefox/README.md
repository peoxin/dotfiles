# Firefox

## Tridactyl

Install the `tridactyl` extension for Firefox, and symlink the configuration file:

```
mkdir -p ~/.config/tridactyl
ln -s $DOTFILES/firefox/tridactylrc ~/.config/tridactyl/tridactylrc
```

Then install the `tridactyl` native messenger and source the configuration file:

```
:installnative
:source
```
