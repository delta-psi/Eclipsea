
{ config, ... }: 

{
  # security.pam.services.hyprlock = { };

  programs.hyprlock = {
    enable = true;

    importantPrefixes = [ "$" "source" ];
    settings = {
      source = [ "${config.xdg.configHome}/hypr/hyprlock-colors.conf" ];
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };

      background = [
        {
          monitor = "";
          path = "${config.xdg.cacheHome}/wallpaper/lock.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -300";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          outer_color = "$input_outer";
          inner_color = "$input_inner";
          font_color = "$input_text";
          check_color = "$input_check";
          fail_color = "$input_error";
          fail_text = "<span foreground='##$failed_input'><b><i> fuck. </i></b></span>";
          outline_thickness = 0;
          placeholder_text = "";
          shadow_passes = 2;
          shadow_size = 12;
        }
      ];
    };
  };
}
