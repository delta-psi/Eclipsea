{ pkgs, ... }:

{

  gtk = {
    enable = true;
    
    theme = {
      package = pkgs.sweet-nova;
      name = "Sweet-Nova";
    };

    iconTheme = {
      package = pkgs.sweet-nova;
      name = "Sweet-cursors";
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
