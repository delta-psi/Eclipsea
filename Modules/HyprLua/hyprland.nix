
# TODO:
# - env (UWSM stuff)
# - hypr-modes: bash -> lua 
# - sources (import colors)
#   - Export colors from wallust to use 
# - CLEAN 
#   - Remove dead code, todo's, etc. 
#   - Make sure everything works, imports in all the right places, etc. 
#   - Make sure code is clean & consistent

# settings
  # monitor
  # curve
  # animation
  # window rule
  # workspaces rules 
  # on (autostart)
  # bind 
  # dsp (dispatchers)
    # window
    # workspace
  # config
    # general 
      # snap
    # decoration
      # blur, shadow, glow, motion_blur
		# animations
		# dwindle
		# misc
		# input
      # touch_pad
    # cursor


{ lib, ... }:

# let 
#   lua = lib.generators.mkLuaInline;
# in
{
  # home.packages = with pkgs; [
  #   hyprpicker
  #   wayland
  # ];

  _module.args = {
    lua = lib.generators.mkLuaInline;
  };

  imports = [
    ./hypr-modes.nix
    ./variables.nix
  ];

  wayland = {
    # systemd.target = "hyprland-session.target";
    windowManager.hyprland = {
      enable = true;
      configType = "lua";
      # package = null;
      # portalPackage = null;
      systemd.enable = false;
      # xwayland.enable = true;

      settings = lib.mkMerge [
        {
          config = lib.mkMerge [
            (import ./general)
            # snap 
            (import ./decoration)
              # blur, shadow, glow, motion_blur
            (import ./animations)
            (import ./dwindle)
            (import ./misc)
            (import ./input)
             # touch_pad
            (import ./cursor)
          ];
        }
        # (import ./env.nix)
        (import ./exec.nix)
        # (import ./variables.nix)
        (import ./sources.nix)
        (import ./keybinds.nix)
        (import ./monitors.nix)
        (import ./layers.nix)
        (import ./windowrules.nix)
        (import ./workspaces.nix)
      ];

      # settings = lib.mkMerge [
      #   (import ./animations.nix)
      #   (import ./decorations.nix)
      #   (import ./env.nix)
      #   (import ./exec.nix)
      #   (import ./general.nix)
      #   (import ./keybinds.nix)
      #   (import ./layers.nix)
      #   (import ./misc.nix)
      #   (import ./monitors.nix)
      #   (import ./sources.nix)
      #   (import ./variables.nix)
      #   (import ./windowrules.nix)
      #   (import ./workspaces.nix)
      # ];
    };
  };
}
