# Zsh reads this for every invocation, including non-interactive SSH commands.
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
