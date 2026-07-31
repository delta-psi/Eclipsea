
{ pkgs, ... }:

{
  clipboard = {
    register = "unnamedplus";
    providers = {
      wl-copy.enable = pkgs.stdenv.isLinux;
      pbcopy.enable = pkgs.stdenv.isDarwin;
    };
  }; 
}
