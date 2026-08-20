
{ lib, inputs, isLaptop, ... }:

# Need to add/fix:
  # btop, starship, hyprland, vscodium, qt, gtk, spicetify, zen browser, vesktop, steam, neovim

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # programs.noctalia-shell = {
  #   enable = isLaptop;
  # };

  config = lib.mkIf isLaptop {
    programs = {
      noctalia-shell.enable = isLaptop;
      kitty.extraConfig = ''
        include ~/.config/kitty/themes/noctalia.conf
      '';
      foot.settings.main = {
        include = "~/.config/foot/themes/noctalia";
      };
      # starship.settings = {
      #   palette = "noctalia";
      # };
      btop.settings = {
        color_theme = "~/.config/btop/themes/noctalia.theme";
      };
      cava.settings = {
        theme = "noctalia";
      };
      zathura.extraConfig = ''
        include ~/.config/zathura/noctaliarc
      '';

      # vscodium.userSettings = {
      #   "workbench.colorTheme" = "Noctalia Dynamic";
      #   "workbench.colorCustomizations" = {
      #     "[Noctalia Dynamic]" = {
      #       "workbench.colorCustomizations" = "some path"
      #     };
      #   }; 
      # };
    };
    # xdg.configFile = {
    #   "starship.toml".text = ''
    #     palette = "noctalia"
    #     [palettes.noctalia]
    #     "~/.cache/noctalia/starship-palette.toml"
    #   '';
    # };
  };
}
