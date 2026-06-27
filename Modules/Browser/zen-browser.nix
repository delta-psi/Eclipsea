
{ inputs, pkgs, ... }: 

let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};

in {
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    env = {
      GTK_THEME = "Adwaita";
    };

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      # NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles = {
      delta = {

        pinsForce = true;
        pinsForceAction = "remove"; # omit or "demote" to keep undeclared pins as normal tabs
        # inherit pins;
        pins = {
          "Email" = {
            id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
            url = "https://mail.protonmail.com";
            position = 101;
            isEssential = true;
          };
          "GitHub" = {
            id = "48e8a119-5a14-4826-9545-91c8e8dd3bf6";
            url = "https://github.com";
            position = 102;
            isEssential = true;
          };
          "Dev Tools" = {
            id = "d85a9026-1458-4db6-b115-346746bcc692";
            isGroup = true;
            isFolderCollapsed = false;
            editedTitle = true;
            position = 200;
            folderIcon = "chrome://browser/skin/zen-icons/selectable/eye.svg";
          };
          "NixOS Packages" = {
            id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
            url = "https://search.nixos.org/packages";
            # folderParentId = pins."Dev Tools".id;
            position = 201;
            isEssential = true;
          };
          "NixOS Options" = {
            id = "92931d60-fd40-4707-9512-a57b1a6a3919";
            url = "https://search.nixos.org/options";
            # folderParentId = pins."Dev Tools".id;
            position = 202;
          };
        };

        containersForce = false; # Delete containers not declared here
        containers = {
          Personal = {
            color = "purple";
            icon = "fingerprint";
            id = 1;
          };
          Work = {
            color = "blue";
            icon = "briefcase";
            id = 2;
          };
          Shopping = {
            color = "green";
            icon = "dollar";
            id = 3;
          };
        };

        spacesForce = false; # Delete spaces not declared here
        spaces = {
          "Personal" = {
            id = "c6de089c-410d-4206-961d-ab11f988d40a";
            position = 1000;
            icon = "🏠";
          };
          "Work" = {
            id = "cdd10fab-4fc5-494b-9041-325e5759195b";
            position = 2000;
            icon = "💼";
            theme = {
              type = "gradient";
              colors = [
                {
                  red = 100;
                  green = 150;
                  blue = 200;
                  algorithm = "floating";
                  type = "explicit-lightness";
                  lightness = 50;
                }
              ];
              opacity = 0.8;
              texture = 0.5;
            };
          };
          "Shopping" = {
            id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
            position = 3000;
            icon = "💸";
          };
        };

        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.view.compact.hide-tabbar" = true;
          "zen.urlbar.behavior" = "float";
          "zen.welcome-screen.seen" = true;
        };

        search = {
          force = true; # Enforce declared search engines on each rebuild
          default = "ddg";
          engines = {
            mynixos = {
              name = "My NixOS";
              urls = [
                {
                  template = "https://mynixos.com/search?q={searchTerms}";
                  params = [
                    {
                      name = "query";
                      value = "searchTerms";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nx"];
            };
            github = {
              name = "GitHub Search";
              urls = [
                {
                  template = "https://github.com/search?q={searchTerms}";
                }
              ];
              definedAliases = ["@gh"];
            };
          };
        };

        bookmarks = {
          force = true; # Rewrite bookmarks on each rebuild (overwrite browser changes)
          settings = [
            {
              name = "Nix Sites";
              toolbar = true;
              bookmarks = [
                {
                  name = "homepage";
                  url = "https://nixos.org/";
                }
                {
                  name = "wiki";
                  tags = ["wiki" "nix"];
                  url = "https://wiki.nixos.org/";
                }
                {
                  name = "packages";
                  url = "https://search.nixos.org/packages";
                }
                {
                  name = "Nix Options";
                  url = "https://mynixos.com/";
                }
                {
                  name = "Home-Manager";
                  url = "https://nix-community.github.io/home-manager/options/home-manager/index.html";
                }
              ];
            }
            {
              name = "Development";
              bookmarks = [
                {
                  name = "GitHub";
                  url = "https://github.com";
                }
              ];
            }
          ];
        };

        extensions.packages = with firefox-addons; [
          ublock-origin
          dearrow
          proton-pass
          # vimium-ff
        ];

        # In order to avoid breaking changes here, sometimes when you upgrade you
        # should be asked to bump this version
        keyboardShortcutsVersion = 19;
        keyboardShortcuts = [
          {
            id = "zen-compact-mode-toggle";
            key = "c";
            modifiers = {
              control = true;
              alt = true;
            };
          }
          {
            id = "zen-toggle-sidebar";
            key = "x";
            modifiers = {
              control = true;
              alt = true;
            };
          }
          {
            id = "key_quitApplication";
            disabled = true;
          }
          {
            id = "key_reload";
            key = "r";
            modifiers.control = true;
          }
          {
            id = "key_reload_skip_cache";
            key = "r";
            modifiers = {
              control = true;
              shift = true;
            };
          }
        ];
      };
    };
  };
}
