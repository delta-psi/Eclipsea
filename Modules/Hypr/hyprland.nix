# ===================================== 
# Hyprland Configuration
# =====================================

# TODO: 
# - Tidy up special workspaces 
#   - Add xray to them 
#   - Lower opacity? 
#   - Larger gaps? 
#   - Different animation 
#     - Special workspaces slide down from top 'over' normal workspaces 
#     - Special workspace to special workspace in horizontal alignment
# - More work on window moving animations 
# - More work on window decorations
# [X] Smaller borders and gaps on square mode 
# - Add borderless Hypr mode(?)
# - Keybinds 
#   - Switch windows from tiled <-> floating 
#   - Grab & move and resize windows via keybinds/mouse 
#   - Resize windows 


{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    # swww
    hyprpicker
    wayland
  ];

  # Bash scripts for hypr modes
  # Window modes to add: glass, opaque, borderless, square
  # Animation modes: Bubbles (current), snappy, smooth/slide 
  # Workspace modes: Something with scrolling layout... but how
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
            hyprctl keyword decoration:blur:size 8 
            hyprctl keyword decoration:blur:passes 5 
            hyprctl keyword decoration:active_opacity 0.85 
            hyprctl keyword decoration:inactive_opacity 0.80 
          else 
            # Disable frost mode
            hyprctl keyword decoration:blur:size 8 
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

  wayland = {
    systemd.target = "hyprland-session.target";
    windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      systemd.enable = true;
      xwayland = {
        enable = true;
      };
      settings = {
        source = [
          "~/.config/hypr/colors.conf"
        ];
        monitor = "HDMI-A-1,2560x1080@60,0x0,1";
        general = {
          border_size = 4;
          gaps_in = 8;
          gaps_out = 16;
          # float_gaps = ;
          # gaps_workspaces = ;
          "col.inactive_border" = "rgba(ffffff22)";
          # "col.active_border" = "rgba(00eaffff) rgba(a020f0ff) 45deg";
          # "col.nogroup_border" = ;
          # "col.nogroup_border_active" = ;
          layout = "dwindle";
          # no_focus_fallback = ;
          # resize_on_border = ;
          # extend_border_grab_area = ;
          # hover_icon_on_border = ;
          allow_tearing = false;
          # resize_corner = ;
          # modal_parent_blocking = ;
          # locale = ;
          # snap = {
          #   enable = true;
          #   window_gap = ;
          #   monitor_gap = ;
          #   border_overlap = ;
          #   respect_gaps = ;
          # };
        };

        # Environment variables
        env = [
          "QT_QPA_PLATFORMTHEME, qt6ct"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "XCURSOR_THEME, Sweet-cursors"
          "XCURSOR_SIZE, 24"
          "HYPRCURSOR_SIZE, 24"
          # "WLR_NO_HARDWARE_CURSORS, 1"
          "LIBVA_DRIVER_NAME, nvidia"
          "_GLX_VENDOR_LIBRARY_NAME, nvidia"

          # ######## Toolkit backends ########
          "GDK_BACKEND, wayland,x11"
          "QT_QPA_PLATFORM, wayland;xcb"
          "SDL_VIDEODRIVER, wayland,x11,windows"
          "CLUTTER_BACKEND, wayland"
          "ELECTRON_OZONE_PLATFORM_HINT, auto"

          # ####### XDG specifications #######
          "XDG_CURRENT_DESKTOP, Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "XDG_SESSION_DESKTOP, Hyprland"
          # "XDG_RUNTIME_DIR, /run/usr/1000"
      
          # ############# Others #############
          "_JAVA_AWT_WM_NONREPARENTING, 1"
        ];
        dwindle = {
          preserve_split = true;
          pseudotile = true;
          smart_split = false;
          smart_resizing = true;
        };
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
        animations = {
          enabled = true;
          workspace_wraparound = false;
          _beziers.bezier = [
            "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
            "emphasizedAccel, 0.3, 0, 0.8, 0.15"
            "emphasizedDecel, 0.05, 0.7, 0.1, 1"
            "overShoot, 0.05, 0.95, 0.05, 1.1"
            # "pop, 1, -0.3, 0.9, 0.1"
            "pop, 0.5, -0.3, 1, 1"
            "standard, 0.2, 1, 0.5, 1"
            # "popClose, 0.25, 1.4, 0.5, 1"
            "smoothMove, 0.3, 0.85, 0.4, 1"
          ];
          animation = [
            "layersIn, 1, 5, emphasizedDecel, slide"
            "layersOut, 1, 4, emphasizedAccel, slide"
            "fadeLayers, 1, 5, standard"
            "windowsIn, 1, 5, overShoot"
            "windowsOut, 1, 3, pop"
            "windowsMove, 1, 6, standard"
            "workspaces, 1, 5, standard"
            "specialWorkspace, 1, 4, specialWorkSwitch, slidefadevert 15%"
            "fade, 1, 6, standard"
            "fadeDim, 1, 6, standard"
            "border, 1, 6, standard"
          ];
        };
        # input = {
        #   touchpad = {
        #   };
        # };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          disable_scale_notification = false;
          # "col.splash" = ;
          # font_family = ;
          # splash_font_family = ;
          force_default_wallpaper = 0;
          vfr = true;
          vrr = 1;
          # mouse_move_enables_dpms = ;
          # key_press_enables_dpms = ;
          # name_vk_after_proc = ;
          # always_follow_on_dnd = ;
          # layers_hog_keyboard_focus = ;
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          disable_autoreload = false;
          # enable_swallow = ;
          # swallow_regex = ;
          # swallow_exception_regex = ;
          # focus_on_active = ;
          mouse_move_focuses_monitor = true;
          allow_session_lock_restore = true;
          # session_lock_xray = ;
          # background_color = ;
          close_special_on_empty = true;
          # on_focus_under_fullscreen = ;
          # exit_window_retains_fullscreen = ;
          # initial_workspace_tracking = ;
          # middle_click_paste = ;
          render_unfocused_fps = 15;
          disable_xdg_env_checks = false;
          # lockdead_screen_delay = ;
          # enable_anr_dialog = ;
          # anr_missed_pings = ;
          # size_limits_tiled = ;
          # disable_watchdog_warning = ;
        };
        # layout = {
        # };
        # workspace = [
        #   "name:zen, gapsin:10, gapsout:10, rounding:15, bordersize:3, shadow:true"
        # ];
        workspace = [
          "special:idle, xray:true, on-created-empty: kitty --class idle-term $idle"
          "special:systemStats, xray:true, on-created-empty: kitty --class btop-term btop"
          "special:clock, xray:true, on-created-empty: kitty --class clock-term era"
        ];

        # Variables
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$mini-term" = "kitty --class kitty-floating -o remember_window_size=no -o initial_window_width=900 -o initial_window_height=550";
        "$browser" = "firefox";
        "$music" = "spotify";
        "$communication" = "vesktop";
        "$idle" = "terminal-rain --lightning-color magenta --speed fast --thunder";

        # Keybinds
        bind = [

          # General binds
          "$mod, T, exec, $terminal"
          "$mod SHIFT, T, exec, $mini-term"
          "$mod, I, togglespecialworkspace, idle"
          "$mod, B, togglespecialworkspace, systemStats"
          "$mod, C, togglespecialworkspace, clock"
          "$mod, Q, killactive"
          "$mod, W, exec, $browser"

          # Tools
          "$mod ALT, H, exec, hyprpicker --autocopy --format=hex"

          # Quickshell 
          # "$mod, SPACE, exec, qs ipc call launcher toggle"

          # Hypr Modes
          "$mod, Z, exec, ~/.config/hypr/zen.sh"
          "$mod ALT, F, exec, ~/.config/hypr/frost.sh"
          "$mod ALT, S, exec, ~/.config/hypr/square.sh"
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

        # FLoating mini terminal window 
        windowrule = {
          name = "mini-term";
          "match:class" = "^(kitty-floating)$";
          float = "on";
          # size = "60% 60%";
          center = "on";
          pin = "on";
          border_color = "rgba(00eaffff) rgba(a020f0ff) 45deg";
          # dim_around = "on";
          animation = "emphasizedAccel";
          opacity = "0.90";
        };

        # windowrule = {
        #   name = "idle-term";
        #   "match:class" = "^(idle-term)";
        #   xray = "true";
        # };

        # windowrule = {
        #   name = "idle";
        #   "match:class" = 
        # };

        exec-once = [
          # Cursors 
          "hyprctl setcursor Sweet-cursors 24"
          "gsettings set org.gnome.desktop.interface cursor-theme 'Sweet-cursors'"
          "gsettings set org.gnome.desktop.interface cursor-size 24"

          "awww-daemon &"
          "awww img --transition-type wave /home/delta/Pictures/Wallpapers/anime-petals-in-water.jpg"
          "qs"
        ];
      };
    };
  };

}
