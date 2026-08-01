{ pkgs, ... }: 

{
  imports = [

    # MARI Server
    # ../../Users/users.nix
    # ../../MARI-Server

    # Personal Server
  ];

  # Declare user(s)
  users = {
    users.delta = {
      name = "delta";
      home = "/Users/delta";
      shell = pkgs.fish;
    };
  };

  # List packages installed in system profile. 
  environment = {
    systemPackages = (import ../../System/common.nix { inherit pkgs; }) ++ (with pkgs; [
      
      # Personal/Mac stuff
      aerospace
      sketchybar
      kitty
      tailscale

      # Editors
      # neovim
      vim 
      emacs

      # CLIs
      # git
      # lazygit
      # tree
      # fastfetch
      # starship
      # zoxide
      # eza
      # gh
      # nh
      # btop
      # tmux
      # ripgrep
      # tmux
      # yazi
      # fzf
      bfs
      # pay-respects
      # rsync

      # Languages
      # texliveFull
      # python314
      # R 
      cbqn
      
      # Fun stuff
      # sl
      # cowsay
      # lolcat
      # tmatrix

    ]);

    shells = [ pkgs.fish ];

    variables = {
      EDITOR = "nvim";
    };
  };

  services.tailscale.enable = true;
  programs.fish.enable = true;

  # Lix (Like Nix)
  nix = {
    package = pkgs.lix;

    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/Users/delta/.config/sops/age/keys.txt";

    secrets = {
      github_token = {
        owner = "delta";
        mode = "0400";
      };
      "github_ed25519" = {
        owner = "delta";
        mode = "0400";
        path = "/Users/delta/.ssh/github_ed25519";
      };
    };
  };

  system.stateVersion = 7;
}
