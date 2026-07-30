
{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      nushell
      wl-clipboard
      smassh
      overskride
      vesktop
      cava
      wev
      hyprpicker
      playerctl
      thunar
      thunar-volman
      thunar-archive-plugin
      vial

      sweet-nova
      sweet
      sweet-folders
      candy-icons
      nwg-look
      elegant-sddm
      inputs.matugen.packages.${stdenv.hostPlatform.system}.default
      inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
      imagemagick
      awww
      wallust
      quickshell
      qt6.qtdeclarative
      kdePackages.qt5compat
      qt5.qtdeclarative
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      qt5.qtgraphicaleffects
      kdePackages.qt6ct
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      inputs.terminal-rain.packages.${stdenv.hostPlatform.system}.terminal-rain-lightning

    ];
  };

}
