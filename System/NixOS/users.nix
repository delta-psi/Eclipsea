
{ pkgs, ... }:

{
  users = {
    users = {
      delta = {
        isNormalUser = true;
        description = "delta";
        extraGroups = [ "networkmanager" "wheel" "video" ];
        shell = pkgs.fish;
      };
    };
    defaultUserShell = pkgs.fish;
  };

}
