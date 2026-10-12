{ pkgs, ... }:

{

  gtk = {
    enable = true;
    
    theme = {
      package = pkgs.sweet-nova;
      name = "Sweet-Dark";
    };

    iconTheme = {
      package = pkgs.sweet-nova;
      name = "Sweet-Rainbow";
    };

    font = {
      name = "CaskaydiaCove Mono Nerd Font";
      size = 12;
    };

    gtk3 = {
      theme = null;
      extraCss = "@import 'colors.css';";
    };

    gtk4 = {
      theme = null;
      extraCss = ''
        @import 'colors.css';
      '';
    };
  };


}
