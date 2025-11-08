{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/audio.nix
    ../../modules/fonts.nix
    ../../modules/packages.nix
    ../../modules/nvidia.nix
    ../../modules/nix-core.nix
  ];

  # Network settings.
  networking.hostName = "msi-desktop";
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # List services.
  services.resolved.enable = true;
  services.openssh.enable = true;
  services.udisks2.enable = true;
  services.hypridle.enable = true;
  hardware.bluetooth.enable = true;

  # Configure display manager.
  services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
        };
      };
    };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    cliphist
    wl-clipboard
    udiskie
    brightnessctl
    playerctl
    libnotify
    trash-cli
    hyprpaper
    hyprpicker
    hyprcursor
    swaybg
    grimblast
    swappy
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];
  programs.git.enable = true;
  programs.bash.enable = true;
  programs.firefox.enable = true;
  programs.thunar.enable = true;
  programs.hyprland.enable = true;
  programs.niri.enable = true;
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;

  # Define user accounts.
  users.users.peoxin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = [];
  };

  # NEVER change this value after the initial install, for any reason.
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  system.stateVersion = "25.05";
}
