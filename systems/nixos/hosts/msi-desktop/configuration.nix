{config, pkgs, inputs, ...}: {
  imports = [./hardware-configuration.nix];

  networking.hostName = "msi-desktop";
  networking.networkmanager.enable = true;
  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
    };
  };

  boot.loader = {
    timeout = 5;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 10;
    efi.canTouchEfiVariables = true;
  };
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  services.resolved.enable = true;
  services.openssh.enable = true;
  services.udisks2.enable = true;
  services.hypridle.enable = true;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
  };

  programs = {
    zsh.enable = true;
    git.enable = true;
    firefox.enable = true;
    thunar.enable = true;
    hyprland.enable = true;
    niri.enable = true;
    xwayland.enable = true;
    waybar.enable = true;
    hyprlock.enable = true;
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    vim curl wget less man
    zip unzip gnutar zstd xz gzip p7zip
    trash-cli
    cliphist wl-clipboard udiskie brightnessctl playerctl libnotify
    hyprpaper hyprpicker hyprcursor grimblast swappy swaybg xwayland-satellite
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  fonts.packages = with pkgs; [
    # CJK, Latin, symbol and programming fonts.
    noto-fonts-cjk-sans noto-fonts-cjk-serif sarasa-gothic maple-mono.CN
    noto-fonts stix-two libertinus
    nerd-fonts.symbols-only noto-fonts-color-emoji jetbrains-mono
  ];

  users.users.peoxin = {
    isNormalUser = true;
    home = "/home/peoxin";
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  # Keep the version used at the initial installation.
  system.stateVersion = "25.05";
}
