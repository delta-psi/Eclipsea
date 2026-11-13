
{ lua, vars, ... }:

let
  combineModes = modeA: modeB: lua ''
    function()
      (${modeA})();
      (${modeB})();
    end
  '';


  borderToggleLua = ''
    function()
      hyprModes.border = not hyprModes.border
      apply_palette(palette == "candy" and "sleek" or "candy")

      if not hyprModes.border then 
        hl.config({
          general = {
            border_size = 0
          },
          decoration = {
            glow = {
              enabled = false
            },
            shadow = {
              range = 25,
              render_power = 2
            }
          }
        })
      else 
        hl.config({
          general = {
            border_size = 4
          },
          decoration = {
            glow = {
              enabled = true
            },
            shadow = {
              range = 10,
              render_power = 4
            }
          }
        })
      end
    end
  '';
  zenModeLua = ''
    function()
      hyprModes.zen = not hyprModes.zen
      hl.dispatch(hl.dsp.exec_cmd("${vars.shellToggle}"))
      if hyprModes.zen then 
        hl.config({
          general = {
            border_size = 0,
            gaps_in = 0,
            gaps_out = 0
          },
          decoration = {
            rounding = 0,
            dim_inactive = false,
            shadow = {
              enabled = false
            },
            glow = {
              enabled = false
            }
          }
        })
      else
        if hyprModes.square then 
          if not hyprModes.borderToggle then 
            hl.config({
              general = {
                border_size = 0
              }
            })
          end
          hl.config({
            general = {
              border_size = 2,
              gaps_in = 4,
              gaps_out = 8
            },
            decoration = {
              rounding = 0,
              dim_inactive = true,
              shadow = {
                enabled = false
              },
              glow = {
                enabled = true
              }
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
              rounding = 30,
              dim_inactive = true,
              shadow = {
                enabled = true
              },
              glow = {
                enabled = true
              }
            }
          })
        end
      end
    end
  '';

  frostModeLua = ''
    function()
      hyprModes.frost = not hyprModes.frost
      if hyprModes.frost then 
        hl.config({
          decoration = {
            blur = {
              size = 7,
              passes = 2
            }
          }
        })
      else 
        hl.config({
          decoration = {
            blur = {
              size = 1,
              passes = 1
            }
          }
        })
      end
    end
  '';

  opaqueModeLua = ''
    function()
      hyprModes.opaque = not hyprModes.opaque
      hl.dispatch(hl.dsp.exec_cmd("${vars.shellOpacityToggle}"))
      if hyprModes.opaque then
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

  squareModeLua = ''
    function()
      hyprModes.square = not hyprModes.square
      hl.dispatch(hl.dsp.exec_cmd("${vars.shellCurveToggle}"))
      if hyprModes.square then 
        hl.config({
          general = {
            border_size = 2,
            gaps_in = 4,
            gaps_out = 8
          },
          decoration = {
            rounding = 0,
            shadow = {
              enabled = false
            },
            glow = {
              enabled = true
            }
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
              rounding = 0,
              shadow = {
                enabled = false
              },
              glow = {
                enabled = false
              }
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
              rounding = 30,
              shadow = {
                enabled = true
              },
              glow = {
                enabled = true
              }
            }
          })
        end
      end
    end
  '';
in
{
  frostMode = lua frostModeLua;
  zenMode = lua zenModeLua;
  squareMode = lua squareModeLua;
  # opaqueMode = lua opaqueModeLua;
  borderToggle = lua borderToggleLua;
  opaqueMode = (combineModes opaqueModeLua borderToggleLua);
  
  driftVibe = (combineModes frostModeLua borderToggleLua);

}
