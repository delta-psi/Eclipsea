
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
    # theme = spicePkgs.themes.hazy;
  };
  
}
