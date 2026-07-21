
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

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
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

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
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

    # Caelestia Shell
    # ...

    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Minecraft Server
    # nix-minecraft = {
    #   url = "github:Infinidoge/nix-minecraft";
    # };


  };

  outputs = 
    inputs@{ 
      nixpkgs,
			nix-darwin, 
			home-manager,
			nix-cachyos-kernel,
      hyprland, 
			nixvim,
			matugen,
			sops-nix,
			calmSDDM,
			terminal-rain,
			spicetify-nix,
			zen-browser,
			firefox-addons, 
			noctalia, 
			... 
    }: 
    let 
      user = "delta";

      commonHmModules = [
        nixvim.homeModules.nixvim
        spicetify-nix.homeManagerModules.spicetify
        hyprland.homeManagerModules.default
      ];

      commonNixOSModules = [
        nixvim.nixosModules.nixvim
        matugen.nixosModules.default
        sops-nix.nixosModules.sops
        calmSDDM.nixosModules.default 
        hyprland.nixosModules.default
      ];

      commonDarwinModules = [
        sops-nix.darwinModules.sops
      ];

      mkHost = 
        {
          hostName, 
          hostHomeDir ? hostName, 
          system, 
          isDarwin ? false, 
          isLaptop ? false, 
          extraSystemModules ? [ ],
          extraHmModules ? [ ],
        }:
        let 
          systemFn = if isDarwin then nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
          hmModule = if isDarwin then home-manager.darwinModules.home-manager else home-manager.nixosModules.home-manager;
        in
        systemFn {
          inherit system;
          specialArgs = { inherit inputs; };

          modules = [
            (./Machines + "/${hostHomeDir}/configuration.nix")
            { nixpkgs.config.allowUnfree = true; }
          ]
          ++ (if isDarwin then commonDarwinModules else commonNixOSModules)
          ++ extraSystemModules
          ++ [
            hmModule
            (
              { config, ... }:
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                  backupFileExtension = "backup";
                  overwriteBackup = true;
                  extraSpecialArgs = {
                    inherit inputs isLaptop isDarwin;
                    machine = hostName;
                    githubTokenPath = config.sops.secrets.github_token.path;
                  };
                  users.${user}.imports = commonHmModules ++ extraHmModules ++ [
                    ./Home/home.nix
                  ];
                };   
              }
            )
          ];
        };
    in
    {
      nixosConfigurations = {
        phi = mkHost {
          hostName = "phi";
          hostHomeDir = "Phi";
          system = "x86_64-linux";
          isLaptop = true;
        };
        nu = mkHost {
          hostName = "nu";
          hostHomeDir = "Nu";
          system = "x86_64-linux";
        };
      };
      darwinConfigurations = {
        mu = mkHost {
          hostName = "mu";
          hostHomeDir = "Mu";
          system = "aarch64-darwin";
          isDarwin = true;
        };
      };
    };
}
#   {
#     nixosConfigurations = {
#       phi = nixpkgs.lib.nixosSystem {
#         specialArgs = {
#           inherit inputs ;
#         };
#         system = "x86_64-linux";
#
#         modules = [
#           # Local
#           ./Machines/Phi/configuration.nix
#           { nixpkgs.config.allowUnfree = true; }
#
#           # Remote
#           nixvim.nixosModules.nixvim
#           matugen.nixosModules.default
#           sops-nix.nixosModules.sops
#           calmSDDM.nixosModules.default 
#           home-manager.nixosModules.home-manager
#           ({ config, ... }: {
#             home-manager = {
#               # useGlobalPkgs = true;
#               useUserPackages = true;
#               useGlobalPkgs = true;
#               backupFileExtension = "backup";
#               overwriteBackup = true;
#               extraSpecialArgs = {
#                 inherit inputs;
#                 machine = "phi";
#                 isLaptop = true;
#                 githubTokenPath = config.sops.secrets.github_token.path;
#               };
#               users = {
#                 delta = {
#                   imports = [
#                     # Local
#                     ./Home/home.nix
#
#                     # Remote
#                     # stylix.homeModules.stylix
#                     nixvim.homeModules.nixvim
#                     spicetify-nix.homeManagerModules.spicetify
#                     # sops-nix.homeManagerModules.sops
#                   ];
#                 };
#               };
#             };
#           })
#         ];
#       };
#       nu = nixpkgs.lib.nixosSystem {
#         specialArgs = {
#           inherit inputs ;
#         };
#         system = "x86_64-linux";
#
#         modules = [
#           # Local
#           ./Machines/Nu/configuration.nix
#           { nixpkgs.config.allowUnfree = true; }
#
#           # Remote
#           nixvim.nixosModules.nixvim
#           matugen.nixosModules.default
#           sops-nix.nixosModules.sops
#           calmSDDM.nixosModules.default 
#           home-manager.nixosModules.home-manager
#           ({ config, ... }: {
#             home-manager = {
#               # useGlobalPkgs = true;
#               useUserPackages = true;
#               useGlobalPkgs = true;
#               backupFileExtension = "backup";
#               overwriteBackup = true;
#               extraSpecialArgs = {
#                 inherit inputs;
#                 machine = "nu";
#                 isLaptop = false;
#                 githubTokenPath = config.sops.secrets.github_token.path;
#               };
#               users = {
#                 delta = {
#                   imports = [
#                     # Local
#                     ./Home/home.nix
#
#                     # Remote
#                     # stylix.homeModules.stylix
#                     nixvim.homeModules.nixvim
#                     spicetify-nix.homeManagerModules.spicetify
#                     # sops-nix.homeManagerModules.sops
#                   ];
#                 };
#               };
#             };
#           })
#         ];
#       };
#     };
#   };
# }
