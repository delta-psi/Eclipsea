
# "~/.config/uwsm/env" for theming, xcursor, Nvidia, & toolkit variables 
# "~/.config/uwsm/env-hyprland" for HYPR* & AQ_* variables 
# `export KEY=VALUE`
# The rest goes in `hl.env()`

{
  home = {
    file = {
      ".config/uwsm/env" = {
        text = ''
          export XCURSOR_THEME=Sweet-cursors
          export XCURSOR_SIZE=24
          _GLX_VENDOR_LIBRARY_NAME=nvidia
          LIBVA_DRIVER_NAME=nvidia
          GDK_BACKEND=wayland,x11
          CLUTTER_BACKEND=wayland
          SDL_VIDEODRIVER=wayland,x11,windows
          ELECTRON_OZONE_PLATFORM_HINT=auto
          _JAVA_AWT_WM_NONREPARENTING=1
          QT_QPA_PLATFORM=wayland;xcb
          QT_QPA_PLATFORMTHEME=qt6ct
          QT_AUTO_SCREEN_SCALE_FACTOR=1
          QT_WAYLAND_DISABLE_WINDOWDECORATION=1
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


