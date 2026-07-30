
{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      dejavu_fonts
      liberation_ttf
      julia-mono
    ];
    enableDefaultPackages= true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };

}
