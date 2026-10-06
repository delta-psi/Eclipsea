
{ config, ... }:

let
  utilsize = "-o remember_window_size=no -o initial_window_width=900 -o initial_window_height=550";
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
  noctaliaBarToggle = "noctalia ipc call bar toggle";
  # shellToggle = if isLaptop then "hl.dispatch(hl.dsp.exec_cmd('${customShellToggle}'))" else "hl.dispatch(hl.dsp.exec_cmd('${noctaliaBarToggle}))"
  audiomix = "kitty --class wiremix-floating ${utilsize} wiremix";
  wifi = "kitty --class wifitui-floating ${utilsize} wifitui --theme=${config.xdg.configHome}/wifitui/matugen.toml";
  wallpaper = "kitty --class wallpaper-selector ${utilsize} yazi ~/Pictures/Wallpapers";
}
