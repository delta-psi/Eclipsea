
{
  snacks = {
    enable = true;
    settings = {
      animate = {
        enabled = true;
        duration = 50;
        easing = "linear";
      };
      indent = {
        enabled = true;
        char = "│";
        scope = {
          enabled = true;
          underline = false;
          char = "┃";
        };
        animate = {
          enabled = true;
          style = "out";
          easing = "linear";
          duration = {
            step = 20;
            total = 2000;
          };
        };
      };
      bigfile = {
        enabled = true;
      };
      health = {
        enabled = true;
      };
      explorer = {
        enabled = true;
      };
      terminal = {
        enabled = true;
      };
      lazygit = {
        enabled = true;
      };
      gh.enabled = true;
      git.enabled = true;
      picker = {
        enabled = true;
      };
      notifier = {
        enabled = true;
        style = "fancy";
      };
      scroll.enabled = false;
      bufdelete = {
        enabled = true;
      };
      words = {
        enabled = true;
      };
      toggle = {
        enabled = true;
      };
      styles = {
        image = {
          col = 0;
        };
      };
      image = {
        enabled = true;
        doc = {
          enabled = true;
          inline.enabled = true;
          float.enabled = false;
        };
        img_dirs = [
          "img"
          "images"
          "assets"
          "static"
          "attachments"
        ];
        math = {
          enabled = false;
        };
      };
      dashboard = {
        enabled = true;
        width = 80;
        pane_gap = 2;
        preset = {
          keys = [
            { 
              icon = " "; 
              key = "f"; 
              desc = "Find File";
              action = ":lua Snacks.picker.files()";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert;";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.picker.grep()";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.picker.recent()";
            }
            { 
              icon = " "; 
              key = "s"; 
              desc = "Restore Session"; 
              action = ":lua require('auto-session').RestoreSession()"; 
            }
            { 
              icon = " "; 
              key = "c"; 
              desc = "Config"; 
              action = ":lua Snacks.picker.files({ cwd = '~/Configs/Eclipsea' })"; 
            }
            { 
              icon = "󰒲 "; 
              key = "l"; 
              desc = "Lazygit"; 
              action = ":lua Snacks.lazygit()"; 
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
        sections = [
          {
            section = "header";
            pane = 1;
          }
          # Left pane - keys and startup info 
          { 
            section = "keys";
            pane = 1;
            gap = 1;
            padding = 1;
          }
          {
            section = "terminal";
            cmd = "fortune -s | fold -s -w 60";
            pane = 1;
            height = 5;
            padding = 1;
            indent = 2;
            interactive = false;
          }
          # Right Pane - Random Pokemon sprite 
          {
            pane = 2;
            padding = 5;
          }
          {
            section = "terminal";
            cmd = "pokemon-colorscripts -r --no-title; sleep .1";
            # cmd = "tmatrix --background=default -C magenta; sleep .1";
            random = 10;
            pane = 2;
            indent = 8;
            height = 30;
            padding = 4;
            interactive = false;
          }
        ];
      };
    };
  };
}
