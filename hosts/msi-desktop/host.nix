{
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home.nix;
  };
  configs = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
