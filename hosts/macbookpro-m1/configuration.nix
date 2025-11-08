{pkgs, ...}: {
  imports = [
    ../../modules/nix-core.nix
    ../../modules/host-config.nix
    ../../modules/common/packages.nix
    ../../modules/common/fonts.nix
    ../../modules/darwin/brew.nix
  ];

  # Enable sudo authentication using Touch ID.
  security.pam.services.sudo_local.touchIdAuth = true;

  # Keyboard settings.
  system.keyboard = {
    enableKeyMapping = true;
    # Map Caps Lock to Escape key.
    remapCapsLockToEscape = true;
  };

  # Use homebrew to install extra packages.
  homebrew = {
    taps = [
      "laishulu/homebrew"
    ];
    brews = [
      "macism"
    ];
    casks = [
      "zen"
      "zed"
      "vlc"
      "gimp"
      "inkscape"
      "raycast"
      "obsidian"
      "typora"
      "pixpin"
      "qbittorrent"
      "qlmarkdown"
      "the-unarchiver"
      "clash-verge-rev"
      "squirrel-app"
    ];
  };

  # Define user accounts.
  system.primaryUser = "peoxin";
  users.users.peoxin = {
    home = "/Users/peoxin";
  };

  # CAREFULLY change this value only if you know what you're doing.
  system.stateVersion = 6;
}
