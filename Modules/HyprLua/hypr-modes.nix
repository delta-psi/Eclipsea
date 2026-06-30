
{ lua, vars, ... }:

{
  zenMode = lua ''
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

  frostMode = lua ''
    function()
      hyprModes.frost = not hyprModes.frost
      if hyprModes.frost then 
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
      hyprModes.opaque = not hyprModes.opaque
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

  squareMode = lua ''
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

  glassMode = lua ''
    function()
      hyprModes.glass = not hyprModes.glass
      if hyprModes.glass then
        hl.config({
          decoration = {
            blur = {
              size = 1,
              passes = 1
            }
          }
        })
      else 
        if hyprModes.frost then 
          hl.config({
            decoration = {
              blur = {
                size = 7,
                passes = 5
              }
            }
          })
        else 
          hl.config({
            decoration = {
              blur = {
                size = 7,
                passes = 2
              }
            }
          })
        end 
      end 
    end
  '';
}
