
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
          # path = "screenshot";
          path = "${config.xdg.cacheHome}/wallpaper/lock.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -200";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          # font_color = "rgb(202, 211, 245)";
          # inner_color = "rgb(91, 96, 120)";
          # inner_color = "rgb(24, 25, 38)";
          # outer_color = "rgb(24, 25, 38)";

          outer_color = "$lock_primary";
          inner_color = "$lock_surface_hi";
          font_color = "$lock_on_surface";
          check_color = "$lock_primary";
          fail_color = "$lock_error";
          outline_thickness = 0;
          placeholder_text = "";
          # placeholder_text = ''\"<span foreground="##cad3f5">Password...</span>"\'';
          # placeholder_text = '\'<span foreground="##cad3f5">Password...</span>'\';
          # placeholder_text = "<i>Password...</i>";
          shadow_passes = 2;
          shadow_size = 8;
        }
      ];
    };
  };
}
