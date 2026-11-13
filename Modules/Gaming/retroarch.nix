
{ pkgs, ... }: 

{
  programs.retroarch = {
    enable = true;
    
    cores = with pkgs.libretro; [
      mgba
      melonds
    ];

    settings = {
      video_driver = "vulkan"; 
      menu_driver = "ozone";
      audio_driver = "pipewire";
    };
  };
}
