
# TODO:
# - sources (import colors)
#   - Export colors from wallust to use 
# - CLEAN 
#   - Remove dead code, todo's, etc. 
#   - Make sure everything works, imports in all the right places, etc. 
#   - Make sure code is clean & consistent

{ pkgs, inputs, lib, isLaptop, config, ... }:

let 
  lua = lib.generators.mkLuaInline;
  vars = import ./variables.nix { inherit isLaptop config lib; };
  # shellToggle = if isLaptop then "hl.dispatch(hl.dsp.exec_cmd('${vars.customShellToggle}'))" else "hl.dispatch(hl.dsp.exec_cmd('${vars.noctaliaBarToggle}))";

  args = { inherit lib lua vars isLaptop; };

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
    ./devices.nix
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
      # package = null;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      # portalPackage = null;
      systemd.enable = false;
      xwayland.enable = true;

      # plugins = [
      #   inputs.hyprgrass.packages.${pkgs.system}.default
      # ];

      # extraLuaFiles."borderVars" = {
      #   autoLoad = false;
      #   content = ''
      #     local colors = require("colors")
      #
      #     local borderColorAccent = colors.borderThemeAccented.active_border
      #     local borderShadowAccent = colors.borderThemeAccented.shadow
      #     local borderGlowAccent = colors.borderThemeAccented.glow
      #
      #     local borderColorSleek = colors.borderThemeSleek.active_border
      #     local borderShadowSleek = colors.borderThemeSleek.shadow
      #     local borderGlowSleek = colors.borderThemeSleek.glow
      #   '';
      # };

      extraConfig = ''
        require("colors")

        hyprModes = {
          zen = false,
          square = false,
          frost = false,
          opaque = false,
          glass = false,
          borderAccent = true,
          borderSleek = false
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
