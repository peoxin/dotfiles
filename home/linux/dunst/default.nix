{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/linux/dunst";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.dunst];
  xdg.configFile."dunst/dunstrc" = create_symlink "${configDir}/dunstrc";
}
