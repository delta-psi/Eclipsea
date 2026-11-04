
{ ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;
    
    settings = {
      tabs = {
        position = "left";
        show = "switching";
        show_switching_delay = 800;
        width = "25%";
        favicons.show = "always";
        # indicator.width = 0;
        padding = true;
        # padding = {
        #   top = 6;
        #   bottom = 6;
        #   left = 8;
        #   right = 8;
        # };
      };

      statusbar.show = "in-mode";

      window.hide_decoration = true;
      scrolling.bar = "never";
      colors.webpage.preferred_color_scheme = "dark";
    };

    keyBindings = {
      normal = {
        "<Alt-t>" = "config-cycle tabs.show switching always";
        "<Alt-Shift-t>" = "config-cycle tabs.show never always";
        "<Alt-b>" = "config-cycle statusbar.show in-mode alwyas";
      };
    };

    extraConfig = ''
      if (config.configdir / 'matugen.py').exists():
          config.source('matugen.py')
    '';
  };
}
