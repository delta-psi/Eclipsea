
{ pkgs, config, lib, ... }:

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

  borderKeys = [
    # Modern UI
    "surface.border" "editor.border" "modernPanel.border" "modernActivityBar.border"

    # General
    "contrastBorder" "contrastActiveBorder" "widget.border" "sash.hoverBorder"
    "focusBorder"                      # see note below

    # Activity bar
    "activityBar.border" "activityBar.activeBorder" "activityBar.activeFocusBorder"
    "activityBar.dropBorder" "sideBarActivityBarTop.border"

    # Side bar
    "sideBar.border" "sideBarTitle.border" "sideBarSectionHeader.border"
    "sideBarStickyScroll.border"

    # Editor groups and tabs
    "editorGroup.border" "editorGroupHeader.border" "editorGroupHeader.tabsBorder"
    "editorGroup.focusedEmptyBorder"
    "tab.border" "tab.activeBorder" "tab.activeBorderTop" "tab.selectedBorderTop"
    "tab.unfocusedActiveBorder" "tab.unfocusedActiveBorderTop"
    "tab.hoverBorder" "tab.unfocusedHoverBorder" "tab.lastPinnedBorder"
    "tab.activeModifiedBorder" "tab.inactiveModifiedBorder"
    "sideBySideEditor.horizontalBorder" "sideBySideEditor.verticalBorder"
    "editorStickyScroll.border" "breadcrumb.background"

    # Panel and terminal
    "panel.border" "panelTitle.border" "panelTitle.activeBorder" "panelSection.border"
    "panelSectionHeader.border" "panelStickyScroll.border" "terminal.border"
    "terminal.tab.activeBorder"

    # Status bar, title bar, menus, command center
    "statusBar.border" "statusBar.debuggingBorder" "statusBar.noFolderBorder"
    "statusBar.focusBorder" "statusBarItem.focusBorder"
    "titleBar.border" "menu.border" "menubar.selectionBorder" "commandCenter.border"

    # Editor internals
    "editorOverviewRuler.border" "editorWidget.border" "editorHoverWidget.border"
    "editorSuggestWidget.border" "peekView.border" "diffEditor.border"

    # Lists, trees, inputs
    "list.focusOutline" "list.inactiveFocusOutline" "list.focusAndSelectionOutline"
    "listFilterWidget.outline" "toolbar.hoverOutline"
    "input.border" "dropdown.border" "button.border" "checkbox.border"

    # Notifications
    "notificationCenter.border" "notificationToast.border" "notifications.border"

    # Explorer background
    "sideBar.background"
  ];

  noBorders = lib.genAttrs borderKeys (_: "#00000000");

  extensions = with ext; [
    # Theme
    pkief.material-icon-theme
    matugenTheme

    # QoL
    vscodevim.vim
    mkhl.direnv                        # load flake/direnv env
    usernamehw.errorlens               # inline diagnostics
    editorconfig.editorconfig
    # streetsidesoftware.code-spell-checker
    tamasfe.even-better-toml
    redhat.vscode-yaml
    eamodio.gitlens 
    mhutchie.git-graph
    gruntfuggly.todo-tree
    mechatroner.rainbow-csv
    yzhang.markdown-all-in-one

    # Languages
    jnoortheen.nix-ide
    charliermarsh.ruff
    posit.air-vscode

    # C
    llvm-vs-code-extensions.vscode-clangd
    vadimcn.vscode-lldb
    twxs.cmake
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

    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "Matugen";

    "vim.useSystemClipboard" = true;
    "vim.hlsearch" = true;
    "vim.leader" = "<space>";
    "vim.handleKeys" = {
      "<C-e>" = false;   # your explorer toggle
      "<C-b>" = false;   # sidebar toggle
      "<C-p>" = false;   # quick open
      "<C-f>" = false;   # find in file
    };
    "editor.lineNumbers" = "relative";

    "editor.fontSize" = 16;
    "terminal.integrated.fontSize" = 15;
    "editor.lineHeight" = 1.5;
    "window.zoomLevel" = 0;
    "debug.console.fontSize" = 14;
    "markdown.preview.fontSize" = 15;

  };


  codiumSettings = {
    "workbench.activityBar.location" = "hidden";
    "workbench.statusBar.visible" = false;
    "window.menuBarVisibility" = "toggle"; 
    "window.commandCenter" = false;
    "workbench.layoutControl.enabled" = false;
    "window.customTitleBarVisibility" = "never";  
    "window.titleBarStyle" = "native";
    "workbench.editor.showTabs" = "single"; 
    "workbench.editor.editorActionsLocation" = "hidden";
    "breadcrumbs.enabled" = false;
    "editor.minimap.enabled" = false;
    "editor.glyphMargin" = false;
    "editor.folding" = false;
    "editor.overviewRulerBorder" = false;
    "editor.scrollbar.vertical" = "hidden";
    "editor.scrollbar.horizontal" = "hidden";
    "workbench.startupEditor" = "none";
    "workbench.tips.enabled" = false;
    "editor.hideCursorInOverviewRuler" = true;
    "python.terminal.activateEnvironment" = false;
    "workbench.colorCustomizations" = noBorders;
    #   "sideBar.border" = "#00000000";
    #   "panel.border" = "#00000000";
    #   "editorGroup.border" = "#00000000";
    #   # "tab.border" = "#00000000";
    #   "sideBarSectionHeader.border" = "#00000000";
    #   "contrastBorder" = "#00000000";
    #   "contrastActiveBorder" = "#00000000";
    #   "focusBorder" = "#00000000";
    #   "activityBar.border" = "#00000000";
    #   "sideBarTitle.border" = "#00000000";
    #   "statusBar.border" = "#00000000";
    #   "titleBar.border" = "#00000000";
    #   "panelSectionHeader.border" = "#00000000";
    #   "editorGroupHeader.border" = "#00000000";
    #   "editorGroupHeader.tabsBorder" = "#00000000";
    #   # "tab.activeBorder" = "#00000000";
    #   # "tab.unfocusedActiveBorder" = "#00000000";
    #   "breadcrumb.background" = "#00000000";
    # };
  } // userSettings;

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
    mutableExtensionsDir = true;

    profiles = {
      default = {
        extensions = extensions;
        keybindings = [
          { 
            key = "ctrl+alt+a"; 
            command = "workbench.action.toggleActivityBarVisibility"; 
          }
          { 
            key = "ctrl+alt+s"; 
            command = "workbench.action.toggleStatusbarVisibility"; 
          }
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
          { 
            key = "ctrl+alt+m"; 
            command = "editor.action.toggleMinimap"; 
          }
        ];
      };
    };
  };
  home.activation.vscodiumSettings = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    install -Dm644 ${pkgs.writeText "vscodium-settings.json" (builtins.toJSON codiumSettings)} \
      "${config.xdg.configHome}/VSCodium/User/settings.json"
  '';
}
