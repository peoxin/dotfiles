{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # Chinese fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    sarasa-gothic

    # Latin fonts
    noto-fonts

    # Symbol fonts
    nerd-fonts.symbols-only
    noto-fonts-color-emoji

    # Programming fonts
    jetbrains-mono
  ];
}
