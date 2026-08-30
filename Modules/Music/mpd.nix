
{ config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/delta/Music";
    dbFile = "${config.xdg.dataHome}/mpd/database";
    network.startWhenNeeded = true;
    extraConfig = ''
      auto_update "yes"
      auto_update_depth "10"

      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };
}
