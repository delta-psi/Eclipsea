
{ inputs, isLaptop, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = isLaptop;
  };
}
