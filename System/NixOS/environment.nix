
{ ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
    };
  };
}
