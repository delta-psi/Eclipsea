{ pkgs, ... }:

{

  gtk = {
    enable = true;
    
    theme = {
      package = pkgs.sweet-nova;
      name = "Sweet-Dark";
    };

    iconTheme = {
      package = pkgs.sweet;
      name = "Sweet-Rainbow";
    };

    font = {
      name = "CaskaydiaCove Mono Nerd Font";
      size = 12;
    };

    gtk4 = {
      theme = null;
    };
  };


}
