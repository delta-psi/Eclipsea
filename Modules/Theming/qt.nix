
{ pkgs, ... }:

{
  qt = {
    enable = true;
    style = {
      name = "Sweet-nova";
      package = pkgs.sweet-nova;
    };
    # platformTheme = "qt5ct";
    qt6ctSettings = {
      Appearance = {
        style = "sweet-nova";
        icon_theme = "Sweet-Rainbow";
        standard_dialogs = "xdgdesktopportal";
      };
    };
    qt5ctSettings = {
      Appearance = {
        style = "sweet-nova";
        icon_theme = "Sweet-Rainbow";
        standard_dialogs = "xdgdesktopportal";      };
    };
    kvantum = {
      enable = true;

    };
  };
}
