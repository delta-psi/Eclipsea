
{ config, pkgs, lib, ... }: 

{

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # presets = [
    #   "catppuccin-powerline"
    # ];
    # settings = {
    #   add_newline = true;
    # };
  };

}
