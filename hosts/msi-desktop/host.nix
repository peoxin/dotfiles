{
  os = "nixos";
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home-nixos.nix;
  };
  configs = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
