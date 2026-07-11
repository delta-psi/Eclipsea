
# TODO: 
#   - Finish Hyprland Configuration
#   - Setup Gaming config 
#   - Add (& configure):  
#     - Zen Browser
#     - Spotify (Spicetify)
#     - Vesktop 
#     - Dolphin 
#   - Add machines to flake 
#     - Laptop: Phi 
#     - Gaming PC: Alpha 
#       - Caelestia/Noctalia Shell (?)
#     - Mac Mini: Mu 
#       - Configure settings (debloat as much as possible)
#       - Minecraft Servers 
#       - WireGuard/Pi-Hole 
#       - Forgejo 
#       - Headscale/Tailscale 
#       - Sunshine/Moonlight 

# let 
#   mkHost = {
#     # General machine configuration stuffs here
#   };
{
  description = "Eclipsea NixOS Configuration";

  inputs = {
    
    # Nixpkgs
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # CachyOS Kernel
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Matugen
    matugen = {
      url = "github:/InioX/Matugen";
    };

    # Sops-nix (secrets)
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Silent SDDM Theme 
    calmSDDM = {
      url = "github:delta-psi/CalmSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # terminal-rain-lightning flake
    terminal-rain.url = "github:delta-psi/terminal-rain-lightning-flake";

    # Spicetify-Nix
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # Firefox extensions via rycee's NUR repository
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia Shell 
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = inputs@{ nixpkgs,
										 home-manager,
										 nix-cachyos-kernel,
										 nixvim,
										 matugen,
										 sops-nix,
										 calmSDDM,
										 terminal-rain,
										 spicetify-nix,
										 zen-browser,
                     firefox-addons, 
                     noctalia, 
										 ... }: {
    nixosConfigurations = {
      phi = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs ;
        };
        system = "x86_64-linux";

        modules = [
          # Local
          ./Machines/Phi/configuration.nix
          { nixpkgs.config.allowUnfree = true; }

          # Remote
          nixvim.nixosModules.nixvim
          matugen.nixosModules.default
          sops-nix.nixosModules.sops
          calmSDDM.nixosModules.default 
          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              overwriteBackup = true;
              extraSpecialArgs = {
                inherit inputs;
                machine = "phi";
                isLaptop = true;
                githubTokenPath = config.sops.secrets.github_token.path;
              };
              users = {
                delta = {
                  imports = [
                    # Local
                    ./Home/home.nix

                    # Remote
                    # stylix.homeModules.stylix
                    nixvim.homeModules.nixvim
                    spicetify-nix.homeManagerModules.spicetify
                    # sops-nix.homeManagerModules.sops
                  ];
                };
              };
            };
          })
        ];
      };
      nu = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs ;
        };
        system = "x86_64-linux";

        modules = [
          # Local
          ./Machines/Nu/configuration.nix
          { nixpkgs.config.allowUnfree = true; }

          # Remote
          nixvim.nixosModules.nixvim
          matugen.nixosModules.default
          sops-nix.nixosModules.sops
          calmSDDM.nixosModules.default 
          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              overwriteBackup = true;
              extraSpecialArgs = {
                inherit inputs;
                machine = "nu";
                isLaptop = false;
                githubTokenPath = config.sops.secrets.github_token.path;
              };
              users = {
                delta = {
                  imports = [
                    # Local
                    ./Home/home.nix

                    # Remote
                    # stylix.homeModules.stylix
                    nixvim.homeModules.nixvim
                    spicetify-nix.homeManagerModules.spicetify
                    # sops-nix.homeManagerModules.sops
                  ];
                };
              };
            };
          })
        ];
      };
    };
  };
}
