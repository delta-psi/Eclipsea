
# TODO:
# - sources (import colors)
#   - Export colors from wallust to use 
# - CLEAN 
#   - Remove dead code, todo's, etc. 
#   - Make sure everything works, imports in all the right places, etc. 
#   - Make sure code is clean & consistent

{ lib, ... }:

let 
  lua = lib.generators.mkLuaInline;
  vars = import ./variables.nix;
  args = { inherit lib lua vars; };

  configs = lib.mkMerge (map (f: import f args) [
    ./general.nix
    ./decorations.nix
    ./misc.nix
  ]);

  general_settings = lib.mkMerge (map (f: import f args) [
    # ./sources.nix
    ./exec.nix
    ./keybinds.nix
    ./animations.nix
    ./monitors.nix
    ./layers.nix
    ./windowrules.nix
    ./workspaces.nix
  ]);
in 
{
  # imports = [
  #   # ./hypr-modes.nix
  #   ./variables.nix
  # ];

  wayland = {
    windowManager.hyprland = {
      enable = true;
      configType = "lua";
      package = null;
      portalPackage = null;
      systemd.enable = false;
      xwayland.enable = true;

      extraConfig = ''
        require("colors")

        hyprModes = {
          zen = false,
          square = false,
          frost = false,
          opaque = false,
          glass = false
        }
      '';

      settings = lib.mkMerge [
        {
          config = configs;
        }
        general_settings
      ];
    };
  };
}
