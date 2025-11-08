{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/jj";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.jujutsu];
  xdg.configFile."jj/config.toml" = create_symlink "${configDir}/config.toml";
}
