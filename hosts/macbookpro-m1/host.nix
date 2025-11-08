{
  os = "darwin";
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home-darwin.nix;
  };
  configs = [
    ./configuration.nix
  ];
}
