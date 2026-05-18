# Hyprland Decorations
# ==============================================================


# { ... }:

{
  decoration = {
    rounding = 30;
    rounding_power = 4.0;
    active_opacity = 0.85; # 0.50
    inactive_opacity = 0.80;
    fullscreen_opacity = 1;
    # dim_modal = ;
    # dim_inactive = ;
    # dim_strength = ;
    # dim_special = ;
    # dim_around = ;
    # screen_shader = ;
    # border_part_of_window = ;
    blur = {
      enabled = true;
      size = 7; # 3
      passes = 2; # 3
      ignore_opacity = true;
      new_optimizations = true;
      xray = false;
      noise = 0.02;
      contrast = 0.90;
      brightness = 0.80;
      vibrancy = 0.70;
      vibrancy_darkness = 0.20;
      special = true;
      popups = true;
      popups_ignorealpha = 0.2;
      input_methods = true;
      input_methods_ignorealpha = 0.2;
    };
    shadow = {
      enabled = true;
      range = 20;
      render_power = 4;
      # sharp = ;
      # ignore_window = ;
      # color = "rgba(00eaff33)";
      # color_inactive = ;
      # offset = ;
      # scale = ;
    };
    # glow = {
    #   enabled = ;
    #   range = ;
    #   render_power = ;
    #   color = ;
    #   color_inactive = ;
    # };
  };
}
