{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./minimal.nix
    ./audio.nix
  ];

  services.hypridle.enable = true;
  services.udisks2.enable = true;

  programs.hyprland.enable = true;
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
    hyprpaper
    hyprpicker
    hyprcursor
    grimblast
    swappy
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];
}
