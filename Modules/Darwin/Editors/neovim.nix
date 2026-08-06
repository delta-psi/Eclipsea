{ ... }: 
                                                                                                                  
{

  programs.nixvim = {
    enable = true;
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          transparent_background = true;
          flavour = "macchiato";
        };
      };
    };
    
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      termguicolors = true;
      cursorline = true;
      updatetime = 150;
      list = false;
      conceallevel = 2;
      concealcursor = "nc";
      smartcase = true;
      lazyredraw = false;
      pumblend = 0;
      winblend = 0;
      wildoptions = "pum";
      winborder = "rounded";
      # pumheight = 10;
      wildmode = "longest:full,full";
      completeopt = [ "menu" "menuone" "noselect" "noinsert" ];
      fillchars = {
        eob = " ";
      };
    };

    highlight = {                                                                                                   
      
      # DiffAdd = {
      #   fg = "#a6e3a1";
      #   bg = null;
      # };

      # Core variable groups
      "@variable"                 = { fg = "#ff7eb6"; }; # or your chosen color
      "@variable.member"          = { fg = "#bbbbbb"; }; #ff29ff, #cdcdcd, #adebb3, #99fb98
      "Identifier"                = { fg = "#ff7eb6"; }; #ff7eb6
      "@string"                   = { fg = "#be95ff"; italic = true; };
      "@number"                   = { fg = "#83cfff"; };

      # Keywords (if they're also showing #d0d0d0) #cdcdd0, #bbb6b4
      # "@keyword"                    = { fg = "#ff7eb6"; };
      # "@keyword.function"           = { fg = "#ff7eb6"; };
      # "@keyword.return"             = { fg = "#ff7eb6"; };
      # "@keyword.operator"           = { fg = "#ff7eb6"; }; #be95ff

      # Nix-specific (since you're in a Nix config)
      # "@variable.nix"               = { fg = "#78a9ff"; };
      "@string.special.path.nix"  = { fg = "#be95ff"; };

      # Punctuation
      "@punctuation.bracket"      = { fg = "#3ddbd9"; };
      "@punctuation.delimiter"    = { fg = "#3ddbd9"; };

      # Operators
      "@operator"                 = { fg = "#78a9ff"; }; #86aeda

      # Core windows
      "Normal"                    = { bg = "NONE"; };
      "NormalNC"                  = { bg = "NONE"; };
      "NormalFloat"               = { bg = "NONE"; };
      "FloatBorder"               = { bg = "NONE"; };
      "FloatTitle"                = { bg = "NONE"; };
      "LineNr"                    = { bg = "NONE"; };
      "CursorLineNr"              = { bg = "NONE"; };
      "CursorLine"                = { bg = "NONE"; };


      # Snacks explorer 
      "SnacksExplorerNormal"      = { bg = "NONE"; };
      "SnacksExplorerNormalNC"    = { bg = "NONE"; };
      "SnacksExplorerWinBar"      = { bg = "NONE"; };
      "SnacksIndent"              = { bg = "NONE"; };
      "SnacksIndentScope"         = { bg = "NONE"; };

      # Toggleterm
      "ToggleTerm"                = { bg = "NONE"; };
      "ToggleTermNormal"          = { bg = "NONE"; };
      "Terminal"                  = { bg = "NONE"; };

      # Status/tab lines
      "StatusLine"                = { bg = "NONE"; };
      "StatusLineNC"              = { bg = "NONE"; };
      "TabLine"                   = { bg = "NONE"; };
      "TabLineFill"               = { bg = "NONE"; };
      "TabLineSel"                = { bg = "NONE"; };

      # Splits and sign column
      "VertSplit"                 = { bg = "NONE"; };
      "WinSeparator"              = { bg = "NONE"; };
      "SignColumn"                = { bg = "NONE"; };
      "FoldColumn"                = { bg = "NONE"; };

      # Popups and menus
      "Pmenu"                     = { bg = "NONE"; };
      "PmenuSbar"                 = { bg = "NONE"; };
      "PmenuThumb"                = { bg = "NONE"; };
      "WildMenu"                  = { bg = "NONE"; };
      "WinBar"                    = { bg = "NONE"; };
      "WinBarNC"                  = { bg = "NONE"; };

      # Render-Latex
      "Conceal"                   = { bg = "NONE"; };
      "Special"                   = { fg = "#ff7eb6"; };

      "GitGutterAdd"               = { bg = "NONE"; };
      "GitGutterChange"            = { bg = "NONE"; };
      "GitGutterDelete"            = { bg = "NONE"; };
      "GitGutterChangedelete"      = { bg = "NONE"; };
      "GitGutterTopdelete"         = { bg = "NONE"; };
      "GitGutterUntracked"         = { bg = "NONE"; };

      # End of buffer
      "EndOfBuffer"               = { bg = "NONE"; };                                                               
    };

    keymaps = [
      { 
        mode = "n"; 
        key = "<S-l>"; 
        action = ":bnext<cr>"; 
        options.desc = "Next Buffer"; 
      }
      { 
        mode = "n"; 
        key = "<S-h>"; 
        action = ":bprev<cr>"; 
        options.desc = "Previous Buffer"; 
      }
      { 
        mode = "n"; 
        key = "<leader>v"; 
        action = "<cmd>vsplit<cr>"; 
        options.desc = "Vertical Split"; 
      }
      { 
        mode = "n"; 
        key = "<leader>s"; 
        action = "<cmd>split<cr>"; 
        options.desc = "Horizontal Split"; 
      }
      { 
        mode = "n"; 
        key = "<leader>e"; 
        action = "<cmd>lua Snacks.explorer()<cr>"; 
        options.desc = "File Tree"; 
      }
      { 
        mode = "n";
        key = "<leader>,";
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        options.desc = "Buffer Search";
      }
      { 
        mode = "n";
        key = "<leader>/"; 
        action = "<cmd>lua Snacks.picker.grep()<cr>";
        options.desc = "Grep";
      }
      {
        mode = "n";
        key = "<leader>:";
        action = "<cmd>lua Snacks.picker.command_history()<cr>";
        options.desc = "Command History";
      }
      {
        mode = "n";
        key = "<leader>n";
        action = "<cmd>Snacks.picker.notifications()<cr>";
        options.desc = "Notification History";
      }
      { 
        mode = [ "n" "t" ]; 
        key = "<C-\\>"; 
        action = "<cmd>lua Snacks.terminal.toggle()<cr>"; 
        options.desc = "Toggle Terminal"; 
      } 
      { 
        mode = "n"; 
        key = "<leader>bd"; 
        action = "<cmd>lua Snacks.bufdelete()<cr>"; 
        options.desc = "Delete current buffer"; 
      }
      { 
        mode = "n"; 
        key = "<leader>ba"; 
        action = "<cmd>lua Snacks.bufdelete.all()<cr>"; 
        options.desc = "Delete all buffers"; 
      }
      { 
        mode = "n"; 
        key = "<leader>bo"; 
        action = "<cmd>lua Snacks.bufdelete.other()<cr>"; 
        options.desc = "Delete all except the current buffer"; 
      }
      # {
      #  mode = "n";
      #  key = "<leader>lr";
      #  action.__raw = ''function() require("markdown-latex-render.render").rerender_buf() end'';
      # }
      { 
        mode = "n"; 
        key = "<leader><space>"; 
        action = "<cmd>lua Snacks.picker.smart()<cr>"; 
        options.desc = "File Explorer"; 
      }
      { 
        mode = "n"; 
        key = "<leader>n"; 
        action = "<cmd>lua Snacks.notifier.show_history()<cr>"; 
        options.desc = "Show notifcations history"; 
      }
      {
       mode = "n";
       key = "<leader>h";
       action = "<cmd>lua Snacks.health.check()<cr>";
       options.desc = "Health Check";
      }
      
      # Resize with arrows
      {
       mode = "n";
       key = "<C-Up>";
       action = "<cmd>resize -2<cr>";
      }
      {
       mode = "n";
       key = "<C-Down>";
       action = "<cmd>resize +2<cr>";
      }                                                                                                             
      {
       mode = "n";
       key = "<C-Left>";
       action = "<cmd>vertical resize -2<cr>";
      }
      {
       mode = "n";
       key = "<C-Right>";
       action = "<cmd>vertical resize +2<cr>";
      }
      {
       mode = "n";
       key = "<leader>d";
       action = "<cmd>lua vim.diagnostic.open_float()<cr>";
       options.desc = "Show Diagnostic";
      }
    ];
    
    plugins = {
       
      lualine.enable = true;
      transparent = {
        enable = true;
        autoLoad = true;
      };
      web-devicons.enable = true;
      treesitter = {
        enable = true;
        indent.enable = true;
        highlight.enable = true;
      };
      
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
            notify = true;
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
    };
  };
}
