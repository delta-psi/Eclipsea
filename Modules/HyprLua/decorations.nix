{ ... }:

{
  decoration = {
    rounding = 30;
    rounding_power = 4.0;
    active_opacity = 0.85; # 0.50
    inactive_opacity = 0.85;
    fullscreen_opacity = 1;
    dim_inactive = true;
    dim_strength = 0.3;

    blur = {
      enabled = true;
      size = 7; 
      passes = 2; 
      ignore_opacity = true;
      new_optimizations = true;
      xray = true;
      noise = 0.0;
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
      range = 6; # 8
      render_power = 3; # 3
      # sharp = ;
      # color = "rgba(00eaff33)";
      color_inactive = "rgba(ffffff00)";
      # offset = ;
      # scale = ;
    };
    glow = {
      enabled = true;
      range = 8;
      render_power = 4;
      # color = "rgba(00eaff33)";
      color_inactive = "rgba(ffffff00)";
    };
  };
}

