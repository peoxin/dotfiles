{
  pkgs,
  inputs,
  pkgs-stable,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./ssh.nix
    ../../home/common/fish
    ../../home/common/zsh
    ../../home/common/yazi
    ../../home/common/starship
    ../../home/common/nvim
    ../../home/common/git
    ../../home/common/jj
    # ../../home/common/gitui
    ../../home/common/zellij
    ../../home/common/kitty
    ../../home/common/ghostty
    ../../home/common/firefox
  ];

  programs.direnv.enable = true;
  home.packages = with pkgs; [
    # CLI alternatives
    zoxide # cd
    eza # ls
    bat # cat
    fd # find
    dust # du
    procs # ps
    bottom # top
    sd # sed
    ripgrep # grep
    delta # diff

    # Other CLI tools
    fastfetch
    mise
    fzf
    just
    watchexec
    jq
    tealdeer
    grex
    hexyl
    tokei
    hyperfine
    pastel
    imagemagick
    ffmpeg
    pandoc
    typst
    hugo
    zathura
    ouch

    # Development
    uv
    rustup
    cmake
    meson
    ninja
    # xmake
    clang
    nodejs_24
    python315

    # Code formatters
    ruff # python

    # Not installed for now
    # helix
    # lazygit
    # presenterm
    # black
  ];

  # CAREFULLY change this value only if you know what you're doing.
  home.stateVersion = "25.05";
}
