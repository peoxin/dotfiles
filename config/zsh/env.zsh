# Zsh reads this for every invocation, including non-interactive SSH commands.
if [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env.sh" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env.sh"
fi
