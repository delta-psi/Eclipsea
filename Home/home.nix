# Home Manager Configuration

{ config, pkgs, githubTokenPath, ... }:

{
  imports = [
    ../Modules/Hypr
    ../Modules/Theming
    ../Modules/Terminal
    ../Modules/Editors
  ];

  home = {
    username = "delta";
    homeDirectory = "/home/delta";
    stateVersion = "25.05";
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.sweet-nova;
      name = "Sweet-cursors";
      size = 24;
    };
    # packages = with pkgs; [
    # ];

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

    activation.setupGhAuth = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p $HOME/.config/gh
      printf 'github.com:\n    user: delta-psi\n    oauth_token: %s\n    git_protocol: ssh\n' "$(cat ${githubTokenPath})" > $HOME/.config/gh/hosts.yml
      chmod 600 $HOME/.config/gh/hosts.yml
    '';
  };

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "always";
      colors = "always";
      enableFishIntegration = true;
    };

    fish.enable = true;

    zathura = {
      enable = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "delta-psi";
          email = "deltapsi.exe@proton.me";
        };
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    # Let home-manager manage itself
    home-manager.enable = true;
  };

}
