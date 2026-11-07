
{ pkgs, config, ... }:

let 
  ext = pkgs.open-vsx;
  themesDir = "${config.xdg.dataHome}/matugen-theme/themes";

  matugenTheme = ext.haikalllp.matugen-theme.overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      extdir=$out/share/vscode/extensions/haikalllp.matugen-theme
      rm -rf "$extdir/themes"
      ln -s ${themesDir} "$extdir/themes"
    '';
  });

  extensions = with ext; [
    # Theme
    # daltonmenezes.aura-theme
    # haikalllp.matugen-theme
    pkief.material-icon-theme
    matugenTheme

    # QoL
    mkhl.direnv                        # load flake/direnv env
    usernamehw.errorlens               # inline diagnostics
    editorconfig.editorconfig
    streetsidesoftware.code-spell-checker
    tamasfe.even-better-toml
    redhat.vscode-yaml

    # Languages
    jnoortheen.nix-ide
    charliermarsh.ruff
    posit.air-vscode
  ];

  userSettings = {
    "direnv.restart.automatic" = true;
    "python.terminal.activateEnvironment" = false;
    "editor.formatOnSave" = true;
    "files.autoSave" = "afterDelay";
    "[r]" = { "editor.tabSize" = 2; };
    "files.associations" = {
      "renv.lock" = "json";
    };
    "workbench.colorTheme" = "Matugen";
    # "workbench.colorTheme" = "Dark 2026";
    "workbench.iconTheme" = "material-icon-theme";
  };
in
{

  xdg.dataFile."matugen-theme/themes/.keep".text = "";

  programs.positron = {
    enable = true;
    package = pkgs.positron-bin;
    mutableExtensionsDir = true;

    profiles = {
      default = {
        extensions = extensions;
        userSettings = userSettings;
      };
    };
  };

  programs.vscodium = {
    enable = true;
    # package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles = {
      default = {
        extensions = extensions;
        userSettings = {
          # Chrome
          "workbench.activityBar.location" = "hidden";
          "workbench.statusBar.visible" = false;
          "window.menuBarVisibility" = "toggle";        # Alt shows it temporarily
          "window.commandCenter" = false;
          "workbench.layoutControl.enabled" = false;
          "window.customTitleBarVisibility" = "never";  # only has an effect with native title bar
          "window.titleBarStyle" = "native";

          # Editor area
          "workbench.editor.showTabs" = "single";       # "none" hides tabs entirely
          "workbench.editor.editorActionsLocation" = "hidden";
          "breadcrumbs.enabled" = false;
          "editor.minimap.enabled" = false;
          "editor.glyphMargin" = false;
          "editor.folding" = false;
          "editor.overviewRulerBorder" = false;
          "editor.scrollbar.vertical" = "hidden";
          "editor.scrollbar.horizontal" = "hidden";

          # Noise
          "workbench.startupEditor" = "none";
          "workbench.tips.enabled" = false;
          "editor.hideCursorInOverviewRuler" = true;
          "python.terminal.activateEnvironment" = false;

        } // userSettings;

        keybindings = [
          # { 
          #   key = "ctrl+alt+a"; 
          #   command = "workbench.action.toggleActivityBarVisibility"; 
          # }
          # { 
          #   key = "ctrl+alt+s"; 
          #   command = "workbench.action.toggleStatusbarVisibility"; 
          # }
          {
            key = "ctrl+e";
            command = "workbench.action.toggleSidebarVisibility";
            when = "explorerViewletVisible && filesExplorerFocus";
          }
          {
            key = "ctrl+e";
            command = "workbench.view.explorer";
            when = "!explorerViewletVisible || !filesExplorerFocus";
          }
          # { 
          #   key = "ctrl+alt+m"; 
          #   command = "editor.action.toggleMinimap"; 
          # }
        ];
      };
    };
  };
}
