
{ pkgs, lib, ... }:

{
  clipboard = {
    register = "unnamedplus";
    # providers = {
    #   pbcopy.enable = pkgs.stdenv.isDarwin;
    #   wl-copy.enable = pkgs.stdenv.isLinux;
    # };
    providers = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isDarwin {pbcopy.enable = true; })
      (lib.mkIf pkgs.stdenv.isLinux {wl-copy.enable = true; })
    ];
  }; 
}
