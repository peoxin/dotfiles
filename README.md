# Dotfiles

## Usage

The default location of the configuration folder is `~/dotfiles`. Thus, you can run this command:

```
cd && git clone https://github.com/peoxin/dotfiles.git
```

You can also place the configuration folder somewhere else.
In that case, you need to change the `DOTFILES` environment variable:

```
export DOTFILES="/other/dotfiles/dir/"
```

Follow the instructions in each folder to setup.

## Tips

### Git

For Arch Linux, install `git` and `openssh`.

```
git config --global user.name "name"
git config --global user.email "email-address"

git config --global init.defaultBranch main
git config --global core.autocrlf input

ssh-keygen -t rsa -C "some-comment"
```

### GitUI

Install `gitui` and configurate key bindings `~/.config/gitui/key_bindings.ron`:

```
(
    move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
    move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
    move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
    move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),

    stash_open: Some(( code: Char('l'), modifiers: ( bits: 0,),)),

    open_help: Some(( code: Char('?'), modifiers: ( bits: 0,),)),
)
```

Install catppuccin themes for `gitui`:

```
git clone https://github.com/catppuccin/gitui.git
cp ./gitui/theme/*.ron ~/.config/gitui
```

Use `gitui -t <theme>.ron` to run `gitui` with a theme.
