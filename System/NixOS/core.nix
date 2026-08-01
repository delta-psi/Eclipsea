
# { config, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./time.nix
    ./services.nix
    ./systemd.nix
    ./users.nix
    ./nix.nix
    ./environment.nix
    ./programs.nix
    ./sops.nix # { inherit config; }
    ./packages.nix
    ./fonts.nix
    ./users.nix
  ];
}

