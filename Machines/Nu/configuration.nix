{ inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto;
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [
      "video=2560x1080@60"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVred_PreserveVideoMemoryAllocations=1"
      "fbcon=nodefer"
    ];
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
      	(adi1090x-plymouth-themes.override {
	        selected_themes = [ "lone" ];
	      })
      ];
    };
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    loader.timeout = 0;
  };

  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        Policy = {
          AutoEnable = true;
        };
        LE = {
          MinConnectionInterval = 7;
          MaxConnectionInterval = 9;
          ConnectionLatency = 0;
        };
      };
    };
    logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
  };

  networking = {
    hostName = "nu"; 
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Detroit";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services = {
    # Scheduler
    scx.enable = true;
    
    # Open the OpenSSH daemon
    openssh.enable = true;

    blueman = {
      enable = true;
    };

    # Configure keymap in X11
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      # videoDrivers = [
      #   "nvidia"
      # ];
    };

    gvfs = {
      enable = true;
    };

    udisks2 = {
      enable = true;
    };

    # Enable SDDM login
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = false;
        package = pkgs.kdePackages.sddm;
        # theme = "Elegant";
        settings = {
          Theme.CursorTheme = "Sweet-cursors";
        };
        # extraPackages = with pkgs; [
        #   elegant-sddm
        # ];
      };
    };
  };

  systemd.tmpfiles.rules = let 
    user = "delta";
    iconPath = ../../Assets/avatar;
  in [
    "f+ /var/lib/AccountsService/users/${user}  0600 root root -  [User]\\nIcon=/var/lib/AccountsService/icons/${user}\\n"
    "L+ /var/lib/AccountsService/icons/${user}  -    -    -    -  ${iconPath}"
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      delta = {
        isNormalUser = true;
        description = "delta";
        extraGroups = [ "networkmanager" "wheel" "video" ];
        shell = pkgs.fish;
        # packages = with pkgs; [
        # ];
      };
    };
    defaultUserShell = pkgs.fish;
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-cachyos-kernel.overlays.default
      (final: prev: {
        pnpm_10_29_2 = final.pnpm_10;
      })
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      kitty
      fish
      neovim
      (zathura.override {
        plugins = [ zathuraPkgs.zathura_pdf_mupdf ];
      })
      pokemon-colorscripts
      texliveFull
      xdotool
      imagemagick
      tree
      tmux
      btop
      nh
      fzf
      git
      zoxide
      yazi
      fastfetch
      jq
      awww
      nushell
      wl-clipboard
      fortune
      figlet
      ripgrep
      lazygit
      tmatrix
      gh 
      sops
      age
      ssh-to-age
      mermaid-cli
      ffmpeg
      unzip
      vlc
      smassh
      tukai
      ffmpeg
      overskride
      vesktop
      cava
      wev
      hyprpicker
      era
      playerctl
      thunar
      thunar-volman
      thunar-archive-plugin
      sshfs
      rsync
      remmina
      freerdp

      sweet-nova
      sweet
      sweet-folders
      elegant-sddm
      
      inputs.matugen.packages.${stdenv.hostPlatform.system}.default
      wallust
      quickshell
      qt6.qtdeclarative
      kdePackages.qt5compat
      qt5.qtdeclarative
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      qt5.qtgraphicaleffects


      xdg-desktop-portal
      xdg-desktop-portal-wlr

      inputs.terminal-rain.packages.${stdenv.hostPlatform.system}.terminal-rain-lightning

      python314

    ];
    sessionVariables = {
      # XCURSOR_SIZE = "24";
      # XCURSOR_THEME = "Sweet-cursors";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      # XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      dejavu_fonts
      liberation_ttf
      julia-mono
    ];
    enableDefaultPackages= true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };

  programs = {

    silentSDDM = {
      enable = true;
      theme = "lifedeath";
    };

    ssh = {
      startAgent = true;
    };

    fish = {
      enable = true;
    };

    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    nh = {
      enable = true;
      flake = "/home/delta/Configs/Eclipsea";
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5 --optimise";
      };
    };

    firefox.enable = true;
  };

  # xdg.portal = {
  #   enable = true;
  #   config.common.default = [
  #     "hyprland"
  #     "gtk"
  #   ];
  # };

  nix = {
    settings = {
      experimental-features = [ 
        "nix-command" 
        "flakes" 
      ];
      substituters = [
        "https://attic.xuyh0120.win/lantian"
      ];
      trusted-substituters = [
        "https://attic.xuyh0120.win/lantian"
      ];
      trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      ];
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/delta/.config/sops/age/keys.txt";

    secrets.github_token = {
      owner = "delta";
      mode = "0400";
    };
  };

  system.stateVersion = "25.05"; 

}
