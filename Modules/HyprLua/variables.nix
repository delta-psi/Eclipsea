
{ config, lib, ... }:

let
  utilsize = "-o remember_window_size=no -o initial_window_width=900 -o initial_window_height=550";
  colorsFile = "${config.xdg.configHome}/hypr/colors.lua";
  borderTheme = theme: key: 
    lib.generators.mkLuaInline ''
      dofile("${colorsFile}").${theme}.${key}
    '';
in
{
  mod = "SUPER";
  terminal = "kitty";
  explorer = "thunar";
  browser = "zen-twilight"; # Eventually zen-twilight
  comms = "vesktop";
  music = "spotify";
  miniterm = "kitty --class kitty-floating ${utilsize}";
  # miniterm = "kitty --class kitty-floating";
  idle = "terminal-rain --lightning-color magenta --speed fast --thunder";
  shellToggle = "qs -c Eclipsea-Shell ipc call togglePanels barBezelToggle";
  shellCurveToggle = "qs -c Eclipsea-Shell ipc call layout toggleSquareMode";
  shellLauncherToggle = "qs -c Eclipsea-Shell ipc call applauncher toggle";
  shellOpacityToggle = "qs -c Eclipsea-Shell ipc call opacity toggle";
  shellNotifDismiss = "qs -c Eclipsea-Shell ipc call notifications dimiss";
  shellNotifDismissAll = "qs -c Eclipsea-Shell ipc call notifications dimissAll";
  shellNotifToggleCenter = "qs -c Eclipsea-Shell ipc call notifications toggleCenter";
  shellNotifClear = "qs -c Eclipsea-Shell ipc call notifications clear";
  shellNotifToggleDnd = "qs -c Eclipsea-Shell ipc call notifications toggleDnd";

  # activeBorderAccented = borderTheme "borderThemeAccented" "active_border";
  # shadowColorAccented = borderTheme "borderThemeAccented" "shadow";
  # glowColorAccented = borderTheme "borderThemeAccented" "glow";
  #
  # activeBorderSleek = borderTheme "borderThemeSleek" "active_border";
  # shadowColorSleek = borderTheme "borderThemeSleek" "shadow";
  # glowColorSleek = borderTheme "borderThemeSleek" "glow";



  # noctaliaBarToggle = "noctalia ipc call bar toggle";
  # shellToggle = if isLaptop then "hl.dispatch(hl.dsp.exec_cmd('${customShellToggle}'))" else "hl.dispatch(hl.dsp.exec_cmd('${noctaliaBarToggle}))"
  audiomix = "kitty --class wiremix-floating ${utilsize} wiremix";
  wifi = "kitty --class wifitui-floating ${utilsize} wifitui --theme=${config.xdg.configHome}/wifitui/matugen.toml";
  wallpaper = "kitty --class wallpaper-selector ${utilsize} yazi ~/Pictures/Wallpapers";
}
