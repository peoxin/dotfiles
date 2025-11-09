{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/packages.nix
    ../../modules/fonts.nix
    ../../modules/nix-core.nix
    ../../modules/brew-mirror.nix
  ];

  # Network settings.
  networking.hostName = "macbookpro-m1";

  # Use homebrew to install extra packages.
  homebrew = {
    enable = true;
    onActivation = {
      # Enable homebrew to auto-update itself and all formulae.
      autoUpdate = true;
      # Enable homebrew to upgrade outdated packages.
      upgrade = true;
      # Uninstall all packages not listed in the generated brewfile.
      cleanup = "zap";
    };
    taps = [
      "laishulu/homebrew"
    ];
    brews = [
      "macism"
    ];
    casks = [
      "vlc"
      "gimp"
      "obsidian"
      "typora"
      "pixpin"
      "qlmarkdown"
      "the-unarchiver"
    ];
  };

  # Define user accounts.
  system.primaryUser = "peoxin";
  users.users.peoxin = {
    home = "/Users/peoxin";
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # CAREFULLY change this value only if you know what you're doing.
  system.stateVersion = 6;
}
