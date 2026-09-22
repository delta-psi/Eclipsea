
{ config, pkgs, inputs, ... }:

{
  services = {
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
  };
  hardware = {
    uinput.enable = true;
  };


}
