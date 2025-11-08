{
  config,
  lib,
  pkgs,
  inputs,
  hostConfig,
  ...
}: {
  imports = [
    ./minimal.nix
    ./audio.nix
    ./greetd.nix
  ];

  services.hypridle.enable = true;
  services.udisks2.enable = true;

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    cliphist
    wl-clipboard
    udiskie
    brightnessctl
    playerctl
    libnotify
    hyprpicker
    hyprcursor
    swaybg
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    xwayland-satellite
  ];
}
