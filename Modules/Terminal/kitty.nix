
{ ... }:

{

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.config/kitty/themes/matugen.conf
      symbol_map U+0250-U+02AF,U+1D00-U+1D7F,U+1D80-U+1DBF JuliaMono
      symbol_map U+2100-U+214F,U+2200-U+22FF,U+2300-U+23FF JuliaMono
      symbol_map U+2700-U+27BF,U+27C0-U+27EF,U+2980-U+29FF JuliaMono
      symbol_map U+1D400-U+1D7FF JuliaMono
    '';
    font = {
      name = "JetBrains Mono Nerd Font";
      # name = "JuliaMono";
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
