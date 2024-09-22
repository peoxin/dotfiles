# Dotfiles

## Usage

The default location of the configuration folder is `~/dotfiles`.
Thus, you can run this command:

```
cd && git clone https://github.com/peoxin/dotfiles.git
```

You can also place the configuration folder somewhere else.
Wherever you place it, you then need to set the `DOTFILES` environment variable to that location:

```
export DOTFILES="$HOME/dotfiles" # by default
export DOTFILES="/path/to/dotfiles" # your custom location
```

Finally, you can follow the instructions in each subfolder to setup the configuration.
