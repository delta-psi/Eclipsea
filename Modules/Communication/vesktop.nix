
{ config, ... }:

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
          WhoReacted.enabled = true;
        };
        useQuickCss = true;
      };
      extraQuickCss = ''
        /* Target the home/DM list item wrapper directly to strip the stock discord SVG logo */
        .listItem_e41849 [data-list-item-id="guildsnav___home"] svg:not(.midnight-moon, [class*="moon"], [class*="custom"]) {
          display: none !important;
        }

        /* Fallback generic child wrapper icon purge for the home button */
        #app-mount .guilds_a4daf0 [data-list-item-id="guildsnav___home"] .childWrapper_a6ce15 svg {
          display: none !important;
        }
      '';
    };
  };
}
