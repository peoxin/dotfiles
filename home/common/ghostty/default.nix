{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/ghostty";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages =
    if pkgs.stdenv.isDarwin
    then [pkgs.ghostty-bin]
    else [pkgs.ghostty];
  xdg.configFile."ghostty/config" = create_symlink "${configDir}/config";
}
