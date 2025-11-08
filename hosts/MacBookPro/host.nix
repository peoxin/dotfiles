{
  os = "darwin";
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home.nix;
  };
  configs = [
    ./configuration.nix
  ];
}
