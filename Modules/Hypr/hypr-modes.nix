# Hyprland Modes Scripts
# ==============================================================
# Bash scripts for hypr modes
# Window modes to add: glass, opaque, borderless, square
# Animation modes: Bubbles (current), snappy, smooth/slide 
# Workspace modes: Something with scrolling layout... but how


{ ... }: 

{
  home = {
    file = {
      ".config/hypr/modes.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          # Zen mode 
          if [ -f "/tmp/hypr_zen" ]; then
            # Enable zen mode 
            hyprctl keyword general:gaps_in 0 
            hyprctl keyword general:gaps_out 0 
            hyprctl keyword general:border_size 0 
            hyprctl keyword decoration:rounding 0 
          else 
            # Disable zen mode but keep square mode on 
            if [ -f "/tmp/hypr_square" ]; then 
              hyprctl keyword general:gaps_in 4 
              hyprctl keyword general:gaps_out 8
              hyprctl keyword general:border_size 2 
              hyprctl keyword decoration:rounding 0 
            else 
              # Disable zen mode 
              hyprctl keyword general:gaps_in 8 
              hyprctl keyword general:gaps_out 16 
              hyprctl keyword general:border_size 4 
              hyprctl keyword decoration:rounding 30 
            fi
          fi 

          # Frost Mode 
          if [ -f "/tmp/hypr_frost" ]; then 
            # Enable frost mode 
            hyprctl keyword decoration:blur:size 7 
            hyprctl keyword decoration:blur:passes 5 
            hyprctl keyword decoration:active_opacity 0.85 
            hyprctl keyword decoration:inactive_opacity 0.80 
          else 
            # Disable frost mode
            hyprctl keyword decoration:blur:size 7 
            hyprctl keyword decoration:blur:passes 2 
            hyprctl keyword decoration:active_opacity 0.85 
            hyprctl keyword decoration:inactive_opacity 0.80 
          fi

          # Square mode 
          if [ -f "/tmp/hypr_square" ]; then 
            # Enable square mode 
            hyprctl keyword decoration:rounding 0 
            hyprctl keyword decoration:border_size 2
            hyprctl keyword decoration:gaps_in 4 
            hyprctl keyword decoration:gaps_out 8
          else
            # Disable square mode but keep zen mode on 
            if [ -f "/tmp/hypr_zen" ]; then 
              hyprctl keyword general:gaps_in 0 
              hyprctl keyword general:gaps_out 0 
              hyprctl keyword general:border_size 0 
              hyprctl keyword decoration:rounding 0 
            else  
              # Disable square mode 
              hyprctl keyword decoration:rounding 30
            fi
          fi 

          # Opaque Mode 
          if [ -f "/tmp/hypr_opaque" ]; then 
            hyprctl keyword decoration:active_opacity 1.0
            hyprctl keyword decoration:inactive_opacity 1.0
            # hyprctl keyword decoration:blur:enabled false 
          else 
            hyprctl keyword decoration:active_opacity 0.85
            hyprctl keyword decoration:inactive_opacity 0.80
            # hyprctl keyword decoration:blur:enabled true 
          fi

          # Glass mode 
          # if [ -f "/tmp/hypr_glass" ]; then 
          #   hyprctl keyword decoration:
        ''; 
      };
      ".config/hypr/zen.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          STATE="/tmp/hypr_zen"

          [ -f "$STATE" ] && rm "$STATE" || touch "$STATE"
          ~/.config/hypr/modes.sh 
          
        '';
      };
      ".config/hypr/frost.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          STATE="/tmp/hypr_frost"

          [ -f "$STATE" ] && rm "$STATE" || touch "$STATE"
          ~/.config/hypr/modes.sh 

        '';
      };
      ".config/hypr/square.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash 

          STATE="/tmp/hypr_square"

          [ -f "$STATE" ] && rm "$STATE" || touch "$STATE"
          ~/.config/hypr/modes.sh
        '';
      };
      ".config/hypr/opaque.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          STATE="/tmp/hypr_opaque"

          [ -f "$STATE" ] && rm "$STATE" || touch "$STATE"
          ~/.config/hypr/modes.sh
        '';
      };
    };
  };
}
