
{ ... }:

{
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = false;
      splashBackground = "#000000";
      splashColor = "#ffffff";
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord = {
      # themes = "midnight-discord";
      # themes = ''
      #   @import url("file://${config.xdg.configHome}/vesktop/themes/matugen.theme.css");
      # '';
      settings = {
        enabledThemes = [ "midnight-discord.css" ];
        autoUpdate = false;
        autoUpdateNotification = false;
        disableMinSize = true;
        notifyAboutUpdates = false;
        plugins = {
          FakeNitro = {
            enabled = true;
          };
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          oneko.enabled = true;
          AlwaysAnimate.enabled = true;
        };
        useQuickCss = true;
      };
    };
  };
}
