
{ pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      # GSETTINGS_SCHEMA_DIR="${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
      # XDG_DATA_DIRS = [
        # "/run/current-system/sw/share"
        # "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:$XDG_DATA_DIRS"
      # ];
    };

    # pathsToLink = [
      # "/share/glib-2.0/schemas"
    # ];
  };
}
