
{ pkgs, config, ... }: 

{
  imports = [
    # ../Modules/Terminal 
    # ../Modules/Darwin/Terminal
    # ../Modules/Darwin/Editors/neovim.nix
  ];

  home = {
    username = "test";
    homeDirectory = "/Users/MARI/test";

    packages = with pkgs; [

    ];
   
    # sessionVariables.XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";

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


    starship = {
      enable = true;
      enableFishIntegration = true;
      presets = [
        "catppuccin-powerline"
      ];
      # settings = {
        # add_newline = true;
      # };
    };
    
    # git = {
    #   enable = true;
    #   settings = {
    #     user = {
    #       name = "delta-psi";
    #       email = "deltapsi.exe@proton.me";
    #     };
    #     init.defautBrach = "main";
    #     push.autoSetupRemote = true;
    #   };
    # };

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

    ssh = {
      enable = true;
      # matchBlocks = {
      #   "github.com" = {
      #     hostname = "github.com";
      #     user = "git";
      #     identityFile = "~/.ssh/github_ed25519";
      #     identitiesOnly = true;
      #   };
        # "mu" = {
        #   hostname = "mu";
        #   user = "delta";
        #   identityFile = "~/.ssh/mu_25519";
        # }; 
      # };
    };

    home-manager.enable = true;
  };

}

