
{ pkgs, ... }:

{
  users = {
    users = {
      delta = {
        isNormalUser = true;
        description = "delta";
        extraGroups = [ "networkmanager" "wheel" "video" "uinput" "input" ];
        shell = pkgs.fish;
      };
    };
    defaultUserShell = pkgs.fish;
  };

}
