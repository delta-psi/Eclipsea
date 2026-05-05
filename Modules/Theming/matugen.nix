
{ pkgs, inputs, config, ... }: 

{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  xdg.configFile = {
    "matugen/templates/kitty.conf".text = builtins.readFile ./Templates/kitty.conf;
    "matugen/templates/hypr.conf".text = builtins.readFile ./Templates/hypr.conf;
    "matugen/templates/starship.toml".text = builtins.readFile ./Templates/starship.toml;
    "matugen/config.toml".text = ''
      [config]
      variant = "dark"
      type = "scheme-vibrant"
      contrast = 0

      # [templates.btop]
      # input_path = 'path/to/template'
      # output_path = '~/.config/btop/themes/matugen.theme'
      # post_hook = 'pkill -USR2 btop || true'

      # [templates.cava]
      # input_path = '~/.config/matugen/templates/cava-colors.ini'
      # output_path = '~/.config/cava/themes/your-theme'
      # post_hook = 'pkill -USR1 cava'

      # [templates.gtk3]
      # input_path = 'path/to/template'
      # output_path = '~/.config/gtk-3.0/colors.css'
      # post_hook = 'gsettings set org.gnome.desktop.interface gtk-theme ""; gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-{{mode}}'
      #
      # [templates.gtk4]
      # input_path = 'path/to/template'
      # output_path = '~/.config/gtk-4.0/colors.css'
      
      [templates.hyprland]
      input_path = '${config.xdg.configHome}/matugen/templates/hypr.conf'
      output_path = '${config.xdg.configHome}/hypr/colors.conf'
      post_hook = 'hyprctl reload'

      [templates.kitty]
      input_path = '${config.xdg.configHome}/matugen/templates/kitty.conf'
      output_path = '${config.xdg.configHome}/kitty/themes/matugen.conf'
      post_hook = 'kitty +kitten themes --dump-theme=yes --reload-in=all matugen'

      # [templates.nvim]
      # input_path = 'path/to/templates/nvim-colors.vim'
      # output_path = '~/.config/nvim/colors/matugen.vim'
      # post_hook = 'pkill -SIGUSR1 nvim'

      # [templates.qt5ct]
      # input_path = 'path/to/template'
      # output_path = '~/.config/qt5ct/colors/matugen.conf'
      #
      # [templates.qt6ct]
      # input_path = 'path/to/template'
      # output_path = '~/.config/qt6ct/colors/matugen.conf'
      #
      # [templates.quickshell]
      # input_path = 'path/to/template'
      # output_path = '~/.local/state/quickshell/generated/colors.json'
      #
      # [templates.spotify]
      # input_path = 'path/to/template'
      # output_path = '~/.config/spicetify/Themes/Sleek/color.ini'
      # post_hook = 'spicetify watch -s 2>&1 | sed "/Reloaded Spotify/q"'

      [templates.starship]
      input_path = '${config.xdg.configHome}/matugen/templates/starship.toml'
      output_path = '${config.xdg.configHome}/starship.toml'

      # [templates.yazi]
      # input_path = 'path/to/template'
      # output_path = '~/.config/yazi/theme.toml'

      # [templates.zathura]
      # input_path = 'path/to/template'
      # output_path = '~/.config/zathura/zathurarc'
      #
      # [templates.steam]
      # input_path = 'path/to/template'
      # output_path = '~/.config/AdwSteamGtk/custom.css'
      # post_hook =  'adwaita-steam-gtk -i'
      #
      # [templates.obs]
      # input_path = 'path/to/template'
      # output_path = '~/.config/obs-studio/themes/matugen.obt'
      #
      # [templates.obsidian]
      # input_path = 'path/to/template'
      # output_path = 'yourOwnPath/to/obsidianVault/.obsidian/snippets/matugen.css'

    '';
  };
  
  programs.matugen = {
    enable = true;
  };
}
