{
  hostName = "msi-desktop";
  system = "x86_64-linux";
  configs = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home-linux.nix;
  };
}
