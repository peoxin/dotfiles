{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/nix-core.nix
  ];

  # Network settings.
  networking.hostName = "macbookpro-m1";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # CAREFULLY change this value only if you know what you're doing.
  system.stateVersion = 6;
}
