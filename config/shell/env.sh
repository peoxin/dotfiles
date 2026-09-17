# Shared POSIX environment for Bash and Zsh. Keep this file silent for SSH commands.
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

# Machine-specific environment and credentials belong outside the repository.
if [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/local.sh" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/local.sh"
fi
