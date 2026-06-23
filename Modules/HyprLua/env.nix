
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
      ".config/uwsm/env-hyprland" = {
        text = ''
          export HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.lua"
        '';
      };
    };
  };
}
