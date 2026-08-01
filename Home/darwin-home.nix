{ pkgs, ... }: 

{
  imports = [
    ../Modules/Terminal 
    # ../Modules/Editors
  ];

  users.users.delta = {
    shell = pkgs.fish;
  };

  home = {
    username = "delta";
    homeDirectory = "/Users/delta";

    packages = with pkgs; [

    ];

    stateVersion = "25.11";
  };

  manual.manpages.enable = false;

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "always";
      colors = "always";
      enableFishIntegration = true;
    };

    fish = {
      enable = true;
    };
    
    git = {
      enable = true;
      settings = {
        user = {
          name = "delta-psi";
          email = "deltapsi.exe@proton.me";
        };
        init.defautBrach = "main";
        push.autoSetupRemote = true;
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      enableFishIntegration = true;
    };

    home-manager.enable = true;
  };

}

