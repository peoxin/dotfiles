# Dotfiles

Personal configuration for the `peoxin` account on Arch Linux, macOS and
NixOS. The repository is expected at `~/dotfiles` on manually managed systems
and at `/home/peoxin/dotfiles` on the NixOS host.

## Layout

```text
config/          Native application configuration and manual linking guide
bin/common/      Personal commands shared by desktop systems
bin/linux/       Linux desktop commands
systems/arch/    Arch Linux package and system setup
systems/macos/   macOS package and system setup
systems/nixos/   NixOS flake operations and host configuration
flake.nix        NixOS entry point
```

Configuration files stay native to their applications. Arch Linux and macOS
are configured manually; this repository does not contain an installer or a
task runner. NixOS installs packages and services declaratively and uses Home
Manager to expose the native files alongside user packages and desktop
integration.

## Setup Guides

- [Shared configuration and plugins](config/README.md)
- [Arch Linux](systems/arch/README.md)
- [macOS](systems/macos/README.md)
- [NixOS](systems/nixos/README.md)
