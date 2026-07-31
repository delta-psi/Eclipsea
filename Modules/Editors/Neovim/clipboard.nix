
{ pkgs, ... }:

{
  clipboard = {
    register = "unnamedplus";
    providers = {
      wl-copy = pkgs.stdenv.isLinux;
      pbcopy = pkgs.stdenv.isDarwin;
    };
  }; 
}
