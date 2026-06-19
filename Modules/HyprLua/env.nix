
# "~/.config/uwsm/env" for theming, xcursor, Nvidia, & toolkit variables 
# "~/.config/uwsm/env-hyprland" for HYPR* & AQ_* variables 
# `export KEY=VALUE`
# The rest goes in `hl.env()`

{ ... }:

{
  home = {
    file = {
      ".config/uwsm/env" = {
        text = ''
          export XCURSOR_THEME=Sweet-cursors
          export XCURSOR_SIZE=24
          export _GLX_VENDOR_LIBRARY_NAME=nvidia
          export LIBVA_DRIVER_NAME=nvidia
          export GDK_BACKEND=wayland,x11
          export CLUTTER_BACKEND=wayland
          export SDL_VIDEODRIVER=wayland,x11,windows
          export ELECTRON_OZONE_PLATFORM_HINT=auto
          export _JAVA_AWT_WM_NONREPARENTING=1
          export QT_QPA_PLATFORM=wayland;xcb
          export QT_QPA_PLATFORMTHEME=qt6ct
          export QT_AUTO_SCREEN_SCALE_FACTOR=1
          export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
        '';
      };
    };
    file = {
      ".config/uwsm/env-hyprland" = {
        text = ''
          export HYPRLAND_CONFIG="~/.config/hypr/hyprland.lua"
        '';
      };
    };
  };



  # env = [
  #   "QT_QPA_PLATFORMTHEME, qt6ct"
  #   "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
  #   "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
  #   "XCURSOR_THEME, Sweet-cursors"
  #   "XCURSOR_SIZE, 24"
  #   "HYPRCURSOR_SIZE, 24"
  #   "LIBVA_DRIVER_NAME, nvidia"
  #   "_GLX_VENDOR_LIBRARY_NAME, nvidia"
  #
  #   # ######## Toolkit backends ########
  #   "GDK_BACKEND, wayland,x11"
  #   "QT_QPA_PLATFORM, wayland;xcb"
  #   "SDL_VIDEODRIVER, wayland,x11,windows"
  #   "CLUTTER_BACKEND, wayland"
  #   "ELECTRON_OZONE_PLATFORM_HINT, auto"
  #
  #   # ####### XDG specifications #######
  #   "XDG_CURRENT_DESKTOP, Hyprland"
  #   "XDG_SESSION_TYPE, wayland"
  #   "XDG_SESSION_DESKTOP, Hyprland"
  #   # "XDG_RUNTIME_DIR, /run/usr/1000"
  #
  #   # ############# Others #############
  #   "_JAVA_AWT_WM_NONREPARENTING, 1"
  # ];
}


