{
  nix = {
    # See: https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#prerequisites
    enable = true;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
    };

    # Garbage collection for saving disk space.
    gc = {
      automatic = true;
      options = "--delete-older-than 1w";
    };
  };
}
