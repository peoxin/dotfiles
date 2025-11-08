{
  imports = [
    ./boot.nix
    ./locale.nix
  ];

  # Network settings.
  networking.networkmanager.enable = true;

  # List services.
  services.resolved.enable = true;
  services.openssh.enable = true;

  # System packages.
  programs.bash.enable = true;
  programs.git.enable = true;
}
