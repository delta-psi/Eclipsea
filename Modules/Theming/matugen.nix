
{ inputs, config, ... }: 

{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  xdg.configFile = {
    "matugen/templates/kitty.conf".text = builtins.readFile ./Templates/kitty.conf;
    "matugen/templates/hypr.lua".text = builtins.readFile ./Templates/hypr.lua;
    "matugen/templates/starship.toml".text = builtins.readFile ./Templates/starship.toml;
    "matugen/config.toml".text = ''
      [config]
      variant = "dark"
      type = "scheme-vibrant"
      contrast = 0.5
      reload_apps = true

      [custom_colors]
      surface = "{{ colors.surface.default.hex | saturate: 20 | darken: 5 }}"
      surface_dim = "{{ colors.surface_dim.default.hex | saturate: 20 | darken: 5 }}"
      surface_bright = "{{ colors.surface_bright.default.hex | saturate: 15 }}"
      surface_container_lowest = "{{ colors.surface_container_lowest.default.hex | saturate: 25 | darken: 8 }}"
      surface_container_low = "{{ colors.surface_container_low.default.hex | saturate: 20 | darken: 4 }}"
      surface_container = "{{ colors.surface_container.default.hex | saturate: 18 }}"
      surface_container_high = "{{ colors.surface_container_high.default.hex | saturate: 15 | lighten: 3 }}"
      surface_container_highest = "{{ colors.surface_container_highest.default.hex | saturate: 12 | lighten: 6 }}"
      surface_variant = "{{ colors.surface_variant.default.hex | saturate: 15 }}"

      primary = "{{ colors.primary.default.hex | saturate: 30 }}"
      on_primary = "{{ colors.on_primary.default.hex }}"
      primary_container = "{{ colors.primary_container.default.hex | saturate: 25 }}"
      on_primary_container = "{{ colors.on_primary_container.default.hex }}"

      secondary = "{{ colors.secondary.default.hex | saturate: 25 }}"
      on_secondary = "{{ colors.on_secondary.default.hex }}"
      secondary_container = "{{ colors.secondary_container.default.hex | saturate: 20 }}"
      on_secondary_container = "{{ colors.on_secondary_container.default.hex }}"

      tertiary = "{{ colors.tertiary.default.hex | saturate: 35 }}"
      on_tertiary = "{{ colors.on_tertiary.default.hex }}"
      tertiary_container = "{{ colors.tertiary_container.default.hex | saturate: 30 }}"
      on_tertiary_container = "{{ colors.on_tertiary_container.default.hex }}"

      on_surface = "{{ colors.on_surface.default.hex }}"
      on_surface_variant = "{{ colors.on_surface_variant.default.hex }}"
      inverse_on_surface = "{{ colors.inverse_on_surface.default.hex }}"

      outline = "{{ colors.outline.default.hex | saturate: 10 }}"
      outline_variant = "{{ colors.outline_variant.default.hex | saturate: 10 }}"
      shadow = "{{ colors.shadow.default.hex }}"
      scrim = "{{ colors.scrim.default.hex }}"
      inverse_surface = "{{ colors.inverse_surface.default.hex }}"
      inverse_primary = "{{ colors.inverse_primary.default.hex | saturate: 25 }}"
      error = "{{ colors.error.default.hex }}"
      on_error = "{{ colors.on_error.default.hex }}"
      error_container = "{{ colors.error_container.default.hex }}"
      on_error_container = "{{ colors.on_error_container.default.hex }}"

      black = "{{ colors.surface_container_lowest.default.hex | saturate: 10 }}"
      red = "{{ colors.error.default.hex }}"
      green = "{{ colors.tertiary.default.hex | saturate: 30 }}"
      yellow = "{{ colors.secondary.default.hex | saturate: 25 }}"
      blue = "{{ colors.primary.default.hex | saturate: 30 }}"
      magenta = "{{ colors.inverse_primary.default.hex | saturate: 25 }}"
      cyan = "{{ colors.tertiary_container.default.hex | saturate: 30 }}"
      white = "{{ colors.on_surface.default.hex }}"

      bright_black = "{{ colors.outline.default.hex }}"
      bright_red = "{{ colors.error_container.default.hex }}"
      bright_green = "{{ colors.tertiary_container.default.hex | saturate: 25 }}"
      bright_yellow = "{{ colors.secondary_container.default.hex | saturate: 20 }}"
      bright_blue = "{{ colors.primary_container.default.hex | saturate: 25 }}"
      bright_magenta = "{{ colors.primary.default.hex | saturate: 35 }}"
      bright_cyan = "{{ colors.outline_variant.default.hex }}"
      bright_white = "{{ colors.on_surface_variant.default.hex }}"


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
      input_path = '${config.xdg.configHome}/matugen/templates/hypr.lua'
      output_path = '${config.xdg.configHome}/hypr/colors.lua'
      post_hook = 'hyprctl reload'

      [templates.kitty]
      input_path = '${config.xdg.configHome}/matugen/templates/kitty.conf'
      output_path = '${config.xdg.configHome}/kitty/themes/matugen.conf'
      # post_hook = 'kitty +kitten themes --dump-theme=yes --reload-in=all matugen'
      post_hook = 'kitty @ --to=unix:@kitty set-colors -a ${config.xdg.configHome}/kitty/themes/matugen.conf'

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
