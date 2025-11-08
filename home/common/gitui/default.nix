{
  config,
  pkgs,
  inputs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/gitui";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.gitui];
  xdg.configFile."gitui/key_bindings.ron" = create_symlink "${configDir}/key_bindings.ron";
  xdg.configFile."gitui/theme.ron" = create_symlink "${configDir}/theme.ron";
}
