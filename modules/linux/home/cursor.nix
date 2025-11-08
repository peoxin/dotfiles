{pkgs, ...}: {
  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    gtk.enable = true;
    hyprcursor.enable = true;
    size = 32;
  };
}
