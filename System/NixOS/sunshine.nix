
{ ... }:

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
      settings = {
        publish = {
          disable-publishing = false;
          publish-addresses = true;
          # enable = true;
          # userServices = true;
        };
      };
    };
  };
  hardware = {
    uinput.enable = true;
  };


}
