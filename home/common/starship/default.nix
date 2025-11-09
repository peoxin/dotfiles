{...}: {
  programs.starship = {
    enable = true;
    settings = {
      conda.ignore_base = false;
    };
  };
}
