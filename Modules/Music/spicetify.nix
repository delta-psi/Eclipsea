
{ pkgs, inputs, config, ... }:

let 
  # spicetify = spicetify-nix.lib.mkSpicetify pkgs {
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};

  # };
in {
  xdg.configFile."${config.xdg.configHome}/spicetify/config-xpui.ini".text = ''
    color_scheme = matugen
    current_theme = Sleek
    # spotify_path = /nix/store/yxvg9k92rbcjc84va82hd9ji6hi6gsm7-user-environment/bin/spotify
    spotify_path = /nix/store/1ji0mcpbrj4fv7q9i6p73y56bp0yj9yr-spicetify-Sleek/share/spotify
  '';
  programs.spicetify = {
    enable = true;
    wayland = true;
    # nixpkgs.config.allowUnfree = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    # theme = spicePkgs.themes.comfy;
    theme = spicePkgs.themes.sleek;
    # colorScheme = "custom";
    # customColorScheme = "matugen";
    # colorScheme = "catppuccin-macchiato";
    
    # colorScheme = "rose-pine-moon";
    # theme = spicePkgs.themes.hazy;
    # theme = {
      # name = "Comfy";
      # src = pkgs.fetchFromGitHub {
      #   owner = "Comfy-Themes";
      #   repo = "spicetify";
      #   rev = "32ff101";
      #   hash = "sha256-sqvmSXJMLE2in/cB8ZIJE/t4J5D0PKRddWECdYJjgX0=";
      # };
      # injectCss = true;
      # injectThemeJs = true;
      # replaceColors = true;
      # homeConfig = true;
      # overwriteAssets = false;
      # additionalCss = "";
    # };
  };
  
}
