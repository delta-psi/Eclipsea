{ pkgs, config, githubTokenPath,... }: 

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
      ".ssh/authorized_keys" = {
	text = ''
	  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPEKMtfzbuADY0squhI/86QMjwR0fCl97+8CVVAmMx8U server
	'';
      };
    };

    activation.setupGhAuth = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p $HOME/.config/gh
      printf 'github.com:\n    user: delta-psi\n    oauth_token: %s\n    git_protocol: ssh\n' "$(cat ${githubTokenPath})" > $HOME/.config/gh/hosts.yml
      chmod 600 $HOME/.config/gh/hosts.yml
    '';
    
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

