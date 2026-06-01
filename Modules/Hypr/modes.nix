
{ ... }:

{
  home = {
    file = {
      ".config/hypr/modes.lua" = {
        # executable  = true;
        text = ''
          -- Zen Mode
          hl.bind("SUPER + ALT + Z", function ()
            local gaps = hl.get_config("general.gaps_in")
            if gaps.top == 0 then 
              hl.exec_cmd("hyprctl reload")
            else 
              hl.config({
                general = {
                  gaps_in = 0,
                  gaps_out = 0,
                  border_size = 0,
                },
                decoration = {
                  rounding = 0
                },
              })
            end
          end)

          -- Frost Mode 
          hl.bind("SUPER + ALT + F", function()
            local passes = hl.get_config("decoration.blur.passes")
            if passes == 5 then 
              hl.exec_cmd("hyprctl reload")
            else 
              hl.config({
                decoration = {
                  blur = {
                    passes = 7
                  },
                },
              })
            end
          end)

          -- Opaque Mode
          hl.bind("SUPER + ALT + O", function()
            local opacity = hl.get_config("decoration.active_opacity")
            if opacity == 1.0 then 
              hl.exec_cmd("hyprctl reload")
            else 
              hl.config({
                decoration = {
                  active_opacity = 1.0,
                  inactive_opacity = 1.0,
                },
              })
            end
          end)

          -- Square Mode 
          hl.bind("SUPER + ALT + S", function() 
            local rounding = hl.get_config("decoration.rounding")
            if rounding == 0 then 
              hl.exec_cmd("hyprctl reload")
            else 
              hl.config({
                general = {
                  gaps_in = 4,
                  gaps_out = 8,
                  border_size = 2,
                },
                decoration = {
                  rounding = 0
                },
              })
            end
          end)
        '';
      };
    };
  };
}
