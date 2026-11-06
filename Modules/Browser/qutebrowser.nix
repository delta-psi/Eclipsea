
{ ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;
    
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
    };

    settings = {
      tabs = {
        position = "left";
        show = "never";
        show_switching_delay = 800;
        width = "20%";
        favicons.show = "always";
        last_close = "close";
        background = true;
        # indicator.width = 0;
        # padding = true;
        # padding = {
        #   top = 6;
        #   bottom = 6;
        #   left = 8;
        #   right = 8;
        # };
      };

      completion = {
        open_categories = [
          "searchengines"
          "history"
          "quickmarks"
          "bookmarks"
        ];
      };

      auto_save.session = true;
      session = {
        lazy_restore = true;
        default_name = "default";
      };
      # spellcheck.languages = [ "en-US" ];

      qt.args = [
        "enable-gpu-rasterization"
        "ignore-gpu-blocklist"
        "process-per-site"
        "renderer-process-limit=4"
        "js-flags=--max-old-space-size=384"
        "disk-cache-size=52428800"
        "media-cache-size=10485760"
        "enable-features=VaapiVideoDecoder,VaapiVideoEncoder"
        "enable-accelerated-video-decode"
        "ignore-gpu-blocklist"
        "disable-features=Translate,MediaRouter,OptimizationHints,InterestFeedContentSuggestions"
      ];

      content = {
        blocking = {
          enabled = true;
          method = "both";
        };
        autoplay = false;
        geolocation = false;
        # cookies.accept = "no-3rdparty";
        cookies.accept = "all";
        pdfjs = true;
        cache = {
          size = 52428800;   # 50 MiB in-memory cache
          # maximum_pages = 1;   # back/forward cache pages
        };
      };

      url = {
        start_pages = [ "https://start.duckduckgo.com" ];
        default_page = "https://start.duckduckgo.com";
      };

      fonts = {
        default_family = "JetBrainsMono Nerd Font";
        default_size = "11pt";
      };

      hints.chars = "asdfghjkl";

      statusbar.show = "in-mode";

      window.hide_decoration = true;
      scrolling = {
        bar = "never";
        smooth = true;
      };
      colors = {
        webpage = {
          preferred_color_scheme = "dark";
          darkmode = {
            enabled = true;
            algorithm = "lightness-cielab";
            # algorithm = "colorize";
            policy.images = "smart";
            # threshold = {
              # foreground = 150;
              # background = 0; # 100
              # text = 256;
            # };
            # background.policy = "always";
          };
        };
      };
    };

    keyBindings = {
      normal = {
        "<Alt-t>" = "config-cycle tabs.show switching always";
        "<Alt-Shift-t>" = "config-cycle tabs.show never always";
        "<Alt-b>" = "config-cycle statusbar.show in-mode alwyas";
      };
    };

    extraConfig = ''
      c.tabs.padding = {"top": 6, "bottom": 6, "left": 8, "right": 8}

      c.content.blocking.hosts.lists = [
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
      ]

      if (config.configdir / 'matugen.py').exists():
          config.source('matugen.py')
    '';
  };
}
