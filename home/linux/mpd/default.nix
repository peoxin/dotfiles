{...}: {
  services.mpd = {
    enable = true;
    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"

      audio_output {
          type "pipewire"
          name "Pipewire Sound Server"
      }
    '';
    network.startWhenNeeded = true;
  };
}
