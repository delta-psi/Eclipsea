
{ config, pkgs, lib, ... }:

{

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.config/kitty/themes/matugen.conf
    '';
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 12;
    };
    enableGitIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "yes";
      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";
      # cursor = "#7F00FF";
      cursor_trail = "3";
      cursor_trail_decay = "0.2 0.7";
      cursor_trail_start_threshold = "2";
      # cursor_trail_color = "#00FFFF";
      window_padding_width = "8";
      # input_delay = 0;
      wayland_enable_ime = "no";
      sync_to_monitor = true;
      repaint_delay = "10";
      input_delay = "3";
    };
  };

}
