{ config, pkgs, inputs, ... }:
let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/gitui";
  create_symlink = path: {
      source = config.lib.file.mkOutOfStoreSymlink path;
    };
  gitui = if pkgs.stdenv.isDarwin
      then inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.gitui
      else pkgs.gitui;
in
{
  home.packages = [ gitui ];
  xdg.configFile."gitui/key_bindings.ron" = create_symlink "${configDir}/key_bindings.ron";
  xdg.configFile."gitui/theme.ron" = create_symlink "${configDir}/theme.ron";
}
