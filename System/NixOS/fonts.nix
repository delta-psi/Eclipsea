
{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      julia-mono
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      dejavu_fonts
      liberation_ttf
      unifont
      unifont_upper
    ];
    enableDefaultPackages= true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ 
          "JetBrainsMono Nerd Font"
          "JuliaMono"
          "Noto Sans Symbols"
          "Noto Sans Symbols 2"
          "Noto Sans Math"
          "Unifont"
          "Unifont Upper"
        ];
      };
    };
  };

}
