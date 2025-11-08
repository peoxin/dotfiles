{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Symbols Nerd Font"
        "Sarasa Gothic SC"
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "Symbols Nerd Font"
        "Noto Serif"
        "Noto Serif CJK SC"
      ];
      monospace = [
        "Symbols Nerd Font Mono"
        "JetBrains Mono"
        "Noto Sans Mono"
        "Noto Sans Mono CJK SC"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
}
