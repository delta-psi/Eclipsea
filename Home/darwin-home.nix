{ pkgs, ... }: 

{
  home = {
    username = "delta";
    homeDirectory = "/Users/delta";

    packages = with pkgs; [

    ];

    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

}

