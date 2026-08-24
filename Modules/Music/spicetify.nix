
{ pkgs, inputs, ... }:

let 
  # spicetify = spicetify-nix.lib.mkSpicetify pkgs {
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};

  # };
in {
  programs.spicetify = {
    enable = true;
    wayland = true;
    # nixpkgs.config.allowUnfree = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme = "catppuccin-macchiato";
    
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
