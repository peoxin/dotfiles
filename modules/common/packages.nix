{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    less
    man

    # Archive and compress
    zip
    unzip
    gnutar
    zstd
    xz
    gzip
    p7zip

    # Compiler
    # gcc
  ];
}
