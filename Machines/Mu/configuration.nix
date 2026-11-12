{ pkgs, inputs, ... }: 

{
  imports = [

    # MARI Server
    # ../../MARI/Users/users.nix
    # ../../MARI-Server
    # ../../MARI/devzat.nix


    ../../System/NixOS/sops.nix

    # Personal Server
  ];

  # Declare user(s)
  users = {
    users.delta = {
      name = "delta";
      home = "/Users/delta";
      uid = 501;
      shell = pkgs.fish;
    };
  };

  # List packages installed in system profile. 
  environment = {
    systemPackages = (import ../../System/common.nix { inherit pkgs inputs; }) ++ (with pkgs; [
      
      # Personal/Mac stuff
      # aerospace
      # sketchybar
      kitty
      tailscale

      # Editors
      # vim 
      # emacs

      # CLIs
      # bfs

      # Languages
      # texliveFull
      # python314
      # R 
      # cbqn

      # Misc
      # mupdf
      
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
      POETRY_VIRTUALENVS_IN_PROJECT = "true";
    };
  };

  services = {
    # openssh = {
    #   enable = true;
    # };
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
      loginwindow.GuestEnabled = false;

      NSGlobalDomain = {
        NSAutomaticWindowAnimationsEnabled = false;
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
    activationScripts.postActivation.text = ''
      /usr/bin/mdutil -a -i off >/dev/null 2>&1 || true      # Spotlight indexing off
      /bin/launchctl disable system/com.apple.analyticsd 2>/dev/null || true
    '';

  };

  power = {
    restartAfterPowerFailure = true;  # boot by itself when power returns
    restartAfterFreeze = true;
    sleep.computer = "never";
  };


  # Let the GPU wire more of the 16 GB for local models (resets on reboot,
  # so a daemon re-applies it at boot). Don't go above ~13 GB.
  launchd.daemons.gpu-wired-limit.serviceConfig = {
    Label = "org.nixos.gpu-wired-limit";
    ProgramArguments = [ "/usr/sbin/sysctl" "iogpu.wired_limit_mb=12288" ];
    RunAtLoad = true;
  };

  system.stateVersion = 7;
}
