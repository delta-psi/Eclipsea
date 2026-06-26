
{ pkgs, inputs, ... }:

let 
  # spicetify = spicetify-nix.lib.mkSpicetify pkgs {
  spicePkgs = inputs.spicetify-nix.legacyPaclakes.${pkgs.stdenv.system};

  # };
in {
  programs.spicetify = {
    enable = true;
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    # theme = spicePkgs.themes.hazy;
  };
  
}
