{
  hostName = "macbookpro-m1";
  system = "aarch64-darwin";
  configs = [
    ./configuration.nix
  ];
  homeManagerConfigs = {
    peoxin = ../../users/peoxin/home-darwin.nix;
  };
}
