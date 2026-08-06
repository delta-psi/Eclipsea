{ pkgs, ... }: 

{
  imports = [

    # MARI Server
    ../../Users/users.nix
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
      vim 
      emacs

      # CLIs
      bfs

      # Languages
      # texliveFull
      # python314
      # R 
      cbqn
      
      # Fun stuff

    ]);

    shells = with pkgs; [ 
      fish 
      zsh
      bash
    ];

    variables = {
      EDITOR = "nvim";

      HOMEBREW_NO_ANALYTICS = "1";
      HOMEVREW_NO_AUTO_UPDATE = "1";
      DOTNET_CLI_TELEMETRY_OUTPUT = "1";
      POETRY_VIRTUALENVS_IN_PROJECT = true;
    };
  };

  services = {
    openssh = {
      enable = true;
    };
    tailscale = {
      enable = true; 
    };
  };

  programs = {
    fish = {
      enable = true;
    };
  };

  nix = {

    # Lix (Like Nix)
    package = pkgs.lix;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      # Weekly (Sundays?) @ 6am
      interval = {
        Weekday = 0;
        Hour = 6;
        Minute = 0;
      };
      options = "--delete-older-than 14d";
    };

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

  system = {
    primaryUser = "delta";
    defaults = {
      screensaver.askForPassword = false;
      NSGlobalDomain = {
        NSAutomaricWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.001;
      };
      dock = {
        launchanim = false;
        expose-animation-duration = 0.1;
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;
      };
      finder = {
        ShowExternalHardDrivesOnDesktop = false;
        ShowPathbar = true;
      };
    };
  };

  system.stateVersion = 7;
}
