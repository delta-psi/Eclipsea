
{ machine, ... }:

{
  networking = {
    hostName = "${machine}";
    networkmanager = {
      enable = true;
    };
    firewall = {
      checkReversePath = "loose";
    };
  };
}
