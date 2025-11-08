{ config, lib, pkgs, inputs, ... }:
{
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
}
