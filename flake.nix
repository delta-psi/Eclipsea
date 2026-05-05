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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = inputs@{ nixpkgs, home-manager, nix-cachyos-kernel, nixvim, matugen, sops-nix, ... }: {
    nixosConfigurations = {
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
          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              overwriteBackup = true;
              extraSpecialArgs = {
                inherit inputs;
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
