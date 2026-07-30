
{ inputs, pkgs, ... }:

{
  programs = {

    silentSDDM = {
      enable = true;
      theme = "lifedeath";
    };

    ssh = {
      startAgent = true;
    };

    fish = {
      enable = true;
    };

    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    nh = {
      enable = true;
      flake = "/home/delta/Configs/Eclipsea";
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5 --optimise";
      };
    };

    firefox.enable = true;
  };
 
}
