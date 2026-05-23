# ===================================== 
# Hyprland Configuration
# =====================================

# TODO: 
# - Redo config with lua 
#   - Rewrite hypr mode scripts
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
#   - Grab & move windows via keybinds/mouse 
#   - Resize windows 
#   - Toggle floating (auto set to specific starting size, which can be changed via above keybinds)


{ pkgs, lib, ... }: 

{
  home.packages = with pkgs; [
    hyprpicker
    wayland
  ];

  imports = [
    ./hypr-modes.nix
  ];

  wayland = {
    systemd.target = "hyprland-session.target";
    windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      systemd.enable = false;
      xwayland.enable = true;

      settings = lib.mkMerge [
        (import ./animations.nix)
        (import ./decorations.nix)
        (import ./env.nix)
        (import ./exec.nix)
        (import ./general.nix)
        (import ./keybinds.nix)
        (import ./layers.nix)
        (import ./misc.nix)
        (import ./monitors.nix)
        (import ./sources.nix)
        (import ./variables.nix)
        (import ./windowrules.nix)
        (import ./workspaces.nix)
      ];
    };
  };

}
