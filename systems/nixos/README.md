# NixOS

The `msi-desktop` configuration is fixed to the `peoxin` account and the
checkout at `/home/peoxin/dotfiles`.

Clone or move the repository to that exact path before activating the
configuration. The live application links depend on the checkout remaining
there.

## Host Layout

```text
hosts/msi-desktop/configuration.nix          System packages, users and services
hosts/msi-desktop/home.nix                   User packages, plugins and live links
hosts/msi-desktop/hardware-configuration.nix Generated hardware and filesystem data
```

Application settings remain native files under `config/`. Home Manager exposes
them with out-of-store links, so editing application configuration does not
require a rebuild; reload the affected application instead. Directories that
also contain generated or machine-local content are linked recursively into a
real target directory.

The source-to-target mapping is declared directly in `home.nix`. See the
[shared configuration guide](../../config/README.md) for the manual-platform
layout, but do not run its link commands on NixOS.

## Evaluate And Build

```sh
# Evaluate every flake output without building it or changing flake.lock.
nix flake check --no-build --all-systems --no-write-lock-file

# Build the NixOS closure without activating it.
nix build '.#nixosConfigurations.msi-desktop.config.system.build.toplevel'

# Activate the configuration on msi-desktop.
sudo nixos-rebuild switch --flake '.#msi-desktop'
```

New files must be tracked by Git before evaluating the normal Git-backed flake.
To evaluate a working-tree migration that includes untracked files, use:

```sh
nix flake check --no-build --all-systems --no-write-lock-file path:.
```

Keep the installation's existing `system.stateVersion` and
`home.stateVersion`; these values are compatibility markers, not package release
selectors.

## Inputs And Store Maintenance

```sh
# Update pinned flake inputs explicitly.
nix flake update

# Show the closure size of the running system.
nix path-info --closure-size --human-readable /run/current-system

# Remove old generations and then collect unreachable store paths.
sudo nix-collect-garbage --delete-older-than 14d
```

Home Manager uses the `.backup` suffix when a managed target already exists.
Resolve old backup files manually before switching. MPD keeps its writable
database and playlists in `~/.mpd`; copy an existing database there when
migrating.
