
{ config, pkgs, ... }: 

let
  emulationDir = "${config.home.homeDirectory}/Games";
in
{
  programs.retroarch = {
    enable = true;
    
    cores = {
      mgba.enable = true;
      melonds.enable = true;
    };
    # cores = with pkgs.libretro; [
    #   mgba
    #   melonds
    # ];

    settings = {
      video_driver = "vulkan"; 
      menu_driver = "ozone";
      audio_driver = "pipewire";
      ozone_menu_color_theme = "1";
      video_scale_integer = "true";
      video_fullscreen = "false"; # Set to "true" if you prefer full-screen launch

      # Directories
      rgui_browser_directory = "${emulationDir}/Roms";
      savefile_directory = "${emulationDir}/Saves";
      savestate_directory = "${emulationDir}/States";
      system_directory = "${emulationDir}/Bios";

      # Quality of Life for Pokémon
      fastforward_ratio = "4.0";
      autosave_interval = "10";
      savestate_auto_index = "true";

      # Laptop Keyboard Hotkeys (Hold Left Alt + key)
      input_enable_hotkey = "alt";
      input_toggle_fast_forward = "space";
      input_save_state = "f2";
      input_load_state = "f4";
      input_menu_toggle = "f1";
      input_exit_emulator = "escape";
    };
  };
}
