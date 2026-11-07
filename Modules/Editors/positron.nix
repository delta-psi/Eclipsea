
{ pkgs, ... }:

let 
  extensions = with pkgs.open-vsx; [
    # Theme
    # daltonmenezes.aura-theme
    haikalllp.matugen-theme
    pkief.material-icon-theme

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
    "workbench.colorTheme" = "Aura Soft Dark";
    "workbench.iconTheme" = "material-icon-theme";
  };
in
{
  programs.positron = {
    enable = true;
    package = pkgs.positron-bin;
    mutableExtensionsDir = false;

    profiles = {
      primary = {
        extensions = extensions;
        userSettings = userSettings;
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      inherit extensions userSettings;
    };
  };
}
