{ pkgs, ... }:

{

  gtk = {
    enable = true;
    
    theme = {
      # package = pkgs.sweet-nova;
      # name = "Sweet-Dark";
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
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
      extraCss = ''
        @import url("colors.css");
      '';
    };

    gtk4 = {
      theme = null;
      extraCss = ''
        @import url("colors.css");
      ''; # @import 'colors.css';
    };
  };


}
