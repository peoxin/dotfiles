{hostConfig, ...}: {
  # Network settings.
  networking.hostName = hostConfig.hostName;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = hostConfig.system;
}
