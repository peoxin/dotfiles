{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  # Garbage collection for saving disk space.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
}
