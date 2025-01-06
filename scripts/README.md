# User Scripts

Install user scripts to `~/.local/bin` directory:

```
mkdir -p ~/.local/bin
for script in $DOTFILES/scripts/*.sh; do ln -s $script ~/.local/bin/$(basename $script .sh); chmod u+x $script; done
```
