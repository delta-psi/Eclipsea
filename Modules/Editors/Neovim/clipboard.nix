
{ pkgs, ... }:

{
  clipboard = {
    register = "unnamedplus";
    providers = {
      pbcopy.enable = pkgs.stdenv.isDarwin;
      wl-copy.enable = pkgs.stdenv.isLinux;
    };
  }; 
}
