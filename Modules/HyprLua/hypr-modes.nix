
{ lua, vars, ... }:

{
  zenMode = lua ''
    function()
      hyprModes.zen = not hyprModes.zen
      -- local gaps = hl.get_config("general.gaps_in")
      hl.dispatch(hl.dsp.exec_cmd("${vars.shellToggle}"))
      if hyprModes.zen then 
        hl.config({
          general = {
            border_size = 0,
            gaps_in = 0,
            gaps_out = 0
          },
          decoration = {
            rounding = 0
          }
        })
      else
        if hyprModes.square then 
          hl.config({
            general = {
              border_size = 2,
              gaps_in = 4,
              gaps_out = 8
            },
            decoration = {
              rounding = 0
            }
          })
        else 
          hl.config({
            general = {
              border_size = 4,
              gaps_in = 8,
              gaps_out = 16
            },
            decoration = {
              rounding = 30
            }
          })
        end
      end
    end
  '';
  frostMode = lua ''
    function()
      local blur = hl.get_config("decoration.blur.passes")
      if blur ~= 5 then 
        hl.config({
          decoration = {
            blur = {
              passes = 5
            }
          }
        })
      else 
        hl.config({
          decoration = {
            blur = {
              passes = 2
            }
          }
        })
      end
    end
  '';

  opaqueMode = lua ''
    function()
      local opacity = hl.get_config("decoration.active_opacity")
      if opacity ~= 1.00 then 
        hl.config({
          decoration = {
            active_opacity = 1.00,
            inactive_opacity = 1.00
          }
        })
      else
        hl.config({
          decoration = {
            active_opacity = 0.85,
            inactive_opacity = 0.80
          }
        })
      end 
    end
  '';

  squareMode = lua ''
    function()
      hyprModes.square = not hyprModes.square
      hl.dispatch(hl.dsp.exec_cmd("${vars.shellCurveToggle}"))
      if hyprModes.square then 
        -- local border = hl.get_config("general.border_size")
        hl.config({
          general = {
            border_size = 2,
            gaps_in = 4,
            gaps_out = 8
          },
          decoration = {
            rounding = 0
          }
        })
      else 
        if hyprModes.zen then 
          hl.config({
            general = {
              border_size= 0,
              gaps_in = 0,
              gaps_out = 0
            },
            decoration = {
              rounding = 0
            }
          })
        else
          hl.config({
            general = {
              border_size = 4,
              gaps_in = 8,
              gaps_out = 16
            },
            decoration = {
              rounding = 30
            }
          })
        end
      end
    end
  '';
}
