# Home Manager Configuration

{ config, pkgs, lib, inputs, githubTokenPath, ... }:

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

    activation.setupGhAuth = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p $HOME/.config/gh
      printf 'github.com:\n    user: delta-psi\n    oauth_token: %s\n    git_protocol: ssh\n' "$(cat ${githubTokenPath})" > $HOME/.config/gh/hosts.yml
      chmod 600 $HOME/.config/gh/hosts.yml
    '';
  };

  # sops = {
  #   defaultSopsFile = ./secrets/secrets.yaml;
  #   age.keyFile = "/home/delta/.config/sops/age/keys.txt";
  #   secrets.github_token = {};
  # };

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

  # nixpkgs.config.allowUnfreePredicate = _: true;

}
