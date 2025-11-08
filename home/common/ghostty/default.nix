{ config, pkgs, ... }:
let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/ghostty";
  create_symlink = path: {
      source = config.lib.file.mkOutOfStoreSymlink path;
    };
in
{
  home.packages = [ pkgs.ghostty ];
  xdg.configFile."ghostty/config" = create_symlink "${configDir}/config";
}
