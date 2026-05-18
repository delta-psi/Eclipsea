# Hyprland Keybindings
# ==============================================================


{ ... }: 

{
  bind = [
    # General binds
    "$mod, T, exec, uwsm app -- $terminal"
    "$mod SHIFT, T, exec, uwsm app -- $mini-term"
    "$mod, I, togglespecialworkspace, idle"
    "$mod, B, togglespecialworkspace, systemStats"
    "$mod, C, togglespecialworkspace, clock"
    "$mod, Q, killactive"
    "$mod, W, exec, uwsm app -- $browser"

    # Quickshell commands
    "$mod CONTROL, B, exec, $shellToggle"
    "$mod CONTROL, S, exec, $shellCurveToggle"

    # Tools
    "$mod ALT, H, exec, uwsm app -- hyprpicker --autocopy --format=hex"

    # Hypr Modes
    "$mod, Z, exec, $shellToggle ; ~/.config/hypr/zen.sh"
    "$mod ALT, F, exec, ~/.config/hypr/frost.sh"
    "$mod ALT, S, exec, $shellCurveToggle ; ~/.config/hypr/square.sh"
    "$mod ALT, O, exec, ~/.config/hypr/opaque.sh"

    # Workspaces
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"

    # Move to workspace
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 10"

    # Special workspaces & movements
    "$mod, S, togglespecialworkspace, magic"
    "$mod SHIFT, S, movetoworkspace, special:magic"
    "$mod, M, togglespecialworkspace, music"
    # "$mod SHIFT, M, movetoworkspace, special:music"
    "$mod, D, togglespecialworkspace, communication"
    # "$mod SHIFT, D, movetoworkspace, special:communication"
    # "$mod, B, togglespecialworkspace, systemStats"
    # "$mod SHIFT, B, movetoworkspace, special:systemStats"
    # "$mod, I, togglespecialworkspace, idle"
    # "$mod SHIFT, I, togglespecialworkspace, special:idle"

    # Change focused window 
    "$mod, H, movefocus, l"
    "$mod, J, movefocus, d"
    "$mod, K, movefocus, u"
    "$mod, L, movefocus, r"

    # Swap windows
    "$mod SHIFT, H, swapwindow, l"
    "$mod SHIFT, J, swapwindow, d"
    "$mod SHIFT, K, swapwindow, u"
    "$mod SHIFT, L, swapwindow, r"

    # Misc. window actions 
    "$mod, V, layoutmsg, togglesplit"
    "$mod, F, fullscreen, 0" # True fullscreen
    "$mod SHIFT, F, fullscreen, 1" # Maximized
  ];

}
