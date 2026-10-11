
{ pkgs, config, ... }:

{
  qt = {
    enable = true;
    style = {
      name = "Sweet-nova";
      package = pkgs.sweet-nova;
    };
    platformTheme.name = "qtct";
    qt6ctSettings = {
      Appearance = {
        # style = "sweet-nova";
        icon_theme = "Sweet-Rainbow";
        standard_dialogs = "xdgdesktopportal";
      };
    };
    qt5ctSettings = {
      Appearance = {
        # style = "sweet-nova";
        color_scheme_path = "${config.xdg.configHome}/qt5ct/colors/matugen.conf";
        custom_palette = true;
        icon_theme = "Sweet-Rainbow";
        standard_dialogs = "xdgdesktopportal";      };
    };
    kvantum = {
      enable = true;

    };
  };
}
