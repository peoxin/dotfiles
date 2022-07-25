# Tmux

## Usage

Session management in shell:

```
tmux [new -s session-name]          # create new session
tmux a [-t session-name]            # attach to existing session
tmux ls                             # list all sessions
tmux kill-session -t session-name   # kill session
tmux kill-server                    # kill tmux server
```

Session management:

```
prefix + d    # detach session
prefix + s    # list sessions
prefix + $    # rename session
```

Window management:

```
prefix + c    # create window
prefix + p    # select previous window
prefix + n    # select next window
prefix + 0-9  # select window by number
prefix + w    # list all windows
prefix + ,    # rename window
prefix + &    # kill window
```

Pane management:

```
prefix + \      # split pane right
prefix + -      # split pane down
prefix + ;      # select previous pane
prefix + o      # select next pane
prefix + arrow  # select pane by arrow key
prefix + q      # show pane numbers and select pane
prefix + {      # move pane left
prefix + }      # move pane right
prefix + z      # zoom pane
prefix + !      # break pane into new window
prefix + x      # kill pane
```

Copy mode:

```
prefix + [    # enter copy mode
prefix + ]    # paste buffer
```

Key bindings of plugin manager `tpm` and configuration reloading:

```
prefix + I        # install plugins
prefix + U        # update plugins
prefix + alt + u  # remove plugins not in the list
prefix + R        # reload configuration
```

Key bindings of `tmux-yank` plugin:

```
prefix + y    # copy text to system clipboard
prefix + Y    # copy CWD to system clipboard
```

Commands of `tmuxifier` plugin:

```
tmuxifier new-session session-name    # configure new session
tmuxifier edit-session session-name   # edit configured session
tmuxifier load-session session-name   # load configured session
```

Multiple users can share a tmux session.
If users login in the same account, just attach to the target session.
If users login in different accounts:

```
# User A creates a session
tmux [new -s session-name] -S /tmp/session-socket-name

# Make sure the socket file is accessible by User B
# An easy but unsafe way is to set the permission to 777
chmod 777 /tmp/session-socket-name

# User B attaches to the session
tmux a [-t session-name] -S /tmp/session-socket-name
```
