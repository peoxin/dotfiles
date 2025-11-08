{pkgs, ...}: {
  imports = [
    ../../modules/nix-core.nix
    ../../modules/host-config.nix
    ../../modules/common/packages.nix
    ../../modules/common/fonts.nix
    ../../modules/linux/hyprland.nix
    ../../modules/linux/niri.nix
    ../../modules/linux/nvidia.nix
  ];

  hardware.bluetooth.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    trash-cli
  ];
  programs.firefox.enable = true;
  programs.thunar.enable = true;

  # Define user accounts.
  users.users.peoxin = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.bash;
    packages = [];
  };

  # NEVER change this value after the initial install, for any reason.
  system.stateVersion = "25.05";
}
