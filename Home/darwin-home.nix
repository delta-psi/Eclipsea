{ pkgs, config, ... }: 

{
  imports = [
    ../Modules/Terminal 
    ../Modules/Darwin/Terminal
    # ../Modules/Editors
  ];

  # users.users.delta = {
  #   shell = pkgs.fish;
  # };

  home = {
    username = "delta";
    homeDirectory = "/Users/delta";

    packages = with pkgs; [

    ];

    file = {
      ".ssh/config" = {
        text = ''
          Host github.com
            HostName github.com 
            User git 
            IdentityFile ~/.ssh/github_ed25519
            IdentitiesOnly yes
        '';
      };
    };
    
    sessionVariables.XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";

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

