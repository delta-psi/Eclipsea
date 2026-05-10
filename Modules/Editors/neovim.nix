
{ pkgs, ... }:

# TODO: 
# - markview or render-markdown 
#   - obsidian.nvim?
# - Configure VimTex 
#   - Auto-save -> auto-compile -> auto-update PDF
#   - Have to use Zathura, or find a way to have PDF viewer inside Neovim
# - Not in Nixvim: 
#   - doodle.nvim (Obsidian graph view)
#   - mdmath.nvim (Inline LaTeX rendering using Kitty Graphics Protocol)
# - fugit2 (git UI)
# - flash (?)
# - fidget (?)
# - colorful menu
# - nix
# - otter 
# - Customize lualine, bufferline/tabs 


{
  programs.nixvim = {
    enable = true;
    nixpkgs.config.allowUnfree = true;
    colorschemes = {
      base16 = {
        enable = true;
        colorscheme = {
          base00 = "#161616";
          base01 = "#262626";
          base02 = "#393939";
          base03 = "#525252"; # Comments 

          base04 = "#dde1e6";
          base05 = "#d0d0d0"; 
          base06 = "#ffffff";
          base07 = "#08bdba";

          base08 = "#3ddbd9"; # Brackets, punctuation 
          base09 = "#78a9ff"; # Equal signs, booleans 
          base0A = "#ee5396"; # Classes, field names 
          base0B = "#be95ff"; # Strings 
          base0C = "#ff7eb6"; # Builtins, require 
          base0D = "#3ddbd9"; # Functions: #3ddbd9 #98fb98
          base0E = "#be95ff"; # Keywords 
          base0F = "#82cfff"; # Integers, floats 
        };
      };
    };

    plugins = {

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
          explorer = {
            enabled = true;
          };
          lazygit = {
            enabled = true;
          };
          gh.enabled = true;
          git.enabled = true;
          picker.enabled = true;
          scroll.enabled = false;
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
              enabled = true;
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
              # {
              #   section = "startup";
              # }
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
      
      lualine.enable = true;
      colorizer.enable = true;

      auto-session = {
        enable = true;
        settings = {
          auto_restore = false;
          auto_restore_last_session = false;
        };
      };

      telescope = {
	      enable = true;
	      extensions.fzf-native.enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };

      treesitter = {
	      enable = true;
        settings = {
          indent.enable = true;
        };
        highlight.enable = true;
	      ensureInstalled = [
	        "python"
	        "c"
	        "cpp"
	        "nix"
          "qml"
          "lua"
          "vim"
          "regex"
          "markdown"
          "markdown_inline"
          "bash"
          "latex"
          "html"
          "typst"
          "yaml"
	      ];
      };

      # presence = {
       #   enable = true;
      #   autoLoad = true;
      # };

      # render-markdown = {
      #   enable = true;
      #   autoLoad = true;
      # };

      nvim-autopairs = {
        enable = true;
        autoLoad = true;
      };

      web-devicons.enable = true;

      transparent = {
        enable = true;
        autoLoad = true;
      };

      mini = {
        enable = true;
        modules.animate = {
          open.enable = false;
          close.enable = false;
          cursor = {
            enable = true;
            timing = {
              __raw = ''
                require("mini.animate").gen_timing.linear({ duration = 150 })
              '';
            };
          };
          scroll = {
            enable = true;
            timing = {
              __raw = ''
                require("mini.animate").gen_timing.linear({ duration = 5 })
              '';
            };
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          clangd.enable = true;
          r_language_server = {
            enable = true;
            package = null;
          };
          bashls.enable = true;
          marksman.enable = true;
          texlab.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          qmlls = {
            enable = true;
            package = pkgs.qt6.qtdeclarative;
          };
        };
        keymaps.lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "gi" = "implementation";
          "<leader>ca" = "code_action";
        };
      };

      lspkind = {
        enable = true;
        cmp.enable = true;
      };

      conform-nvim = {
        enable = true;
        formattersByFt = {
          python = [ "black" ];
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          qml = [ "qmlformat" ];
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          python = [ "ruff" ];
        };
      };

      gitsigns.enable = true;

      otter.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<C-space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      vimtex = {
        enable = true;
        texlivePackage = pkgs.texlive.combined.scheme-full;
        zathuraPackage = pkgs.zathura;
        settings = {
          compiler_method = "latexmk";
          view_method = "zathura";
          compiler_latexmk = {
            continuous = 1; 
            callback = 1;
            executable = "latexmk";
            options = [
              "-pdf"
              "-shell-escape"
              "-verbose"
              "-file-line-error"
              "-synctex=1"
              "-interaction=nonstopmode"
            ];
          };
          comiler_latexmk_engines = {
            _ = "-lualatex";
          };
          toc_config = {
            split_pos = "vert topleft";
            split_width = 35;
          };
        };
      };

      markview = {
        enable = true;
        settings = {
          preview = {
            icon_provider = "devicons";
            hybrid_mode = {
              enable = true;
            };
          };
          markdown = {
            headings.enable = true;
            tables.enable = true;
            code_blocks = {
              enable = true;
              style = "block";
            };
            list_items.enable = true;
            checkboxes.enable = true;
          };
          latex = {
            enable = false;
          };
        };
      };

      nvim-r = {
        enable = true;
        settings = {
          r_external_term = 0;
          map_leader = "<\\>";
        };
      };

      molten = {
        enable = true;
        settings = {
          auto_open_output = true;
          image_provider = "image.nvim";
        };
      };

      image = {
        enable = true;
      };

      bufferline.enable = true;

      which-key = {
        enable = true;
        settings = {
          icons.group = "";
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "horizontal";
          open_mapping = "[[<C-\\>]]";
        };
      };

      nerdy = {
        enable = true;
        enableTelescope = true;
      };

      nui = {
        enable = true;
      };

      notify = {
        enable = true;
      };

      noice = {
        enable = true;
        autoLoad = true;
        settings = {
          presets = {
            bottom_search = false;
            command_palette = false;
            inc_rename = false;
            long_message_to_split = false;
            lsp_doc_border = false;
          };
          cmdline = {
            enabled = true;
          };
          messages = {
            enabled = true;
          };
          notify = {
            enabled = true;
          };
          popupmenu = {
            enabled = true;
          };
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
      conceallevel = 0;
      smartcase = true;
      lazyredraw = false;
      pumblend = 0;
      winblend = 0;
      fillchars = {
        eob = " ";
      };
    };

    keymaps = [
      { mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<cr>"; }
      { mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<cr>"; }

      { mode = "n"; key = "<leader>v"; action = "<cmd>vsplit<cr>"; }
      { mode = "n"; key = "<leader>s"; action = "<cmd>split<cr>"; }

      { mode = "n"; key = "<leader>e"; action = "<cmd>lua Snacks.explorer()<cr>"; }

      # Resize with arrows
      { mode = "n"; key = "<C-Up>"; action = "<cmd>resize -2<cr>"; }
      { mode = "n"; key = "<C-Down>"; action = "<cmd>resize +2<cr>"; }
      { mode = "n"; key = "<C-Left>"; action = "<cmd>vertical resize -2<cr>"; }
      { mode = "n"; key = "<C-Right>"; action = "<cmd>vertical resize +2<cr>"; }
    ];

    extraConfigVim = ''
      let g:vimtex_view_automatic = 1
    '';

    extraPackages = with pkgs; [
      python3Packages.pylatexenc
      neovim-remote  
      fd 
      ghostscript
      trash-cli
    ];

    extraConfigLua = ''
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.tex_flavor = 'latex'
    '';

    # extraPlugins = with pkgs; [
    #   (vimUtils.buildVimPlugin {
    #     name = "markdown-latex-render-nvim";
    #
    #   })
    # ];

    autoCmd = [
      {
        event = "FileType";
        pattern = "tex";
        command = "VimtexCompile";
      }
      {
        event = [ "BufEnter" "BufWinEnter" ];
        pattern = [ "*.qml" ];
        command = "setlocal indentexpr= cindent cinoptions=L0,l1,g0,j1,J1,(0,ws,Ws";
      }
      {
        event = [ "ColorScheme" "BufEnter" ];
        pattern = "*";
        command = "highlight Normal guibg=NONE | highlight NormalFloat guibg=NONE | highlight ToggleTerm guibg=NONE | highlight SnacksExplorerNormal guibg=NONE";
      }
    ];

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
      # "Normal"                    = { bg = "NONE"; };
      "NormalNC"                  = { bg = "NONE"; };
      "NormalFloat"               = { bg = "NONE"; };
      "FloatBorder"               = { bg = "NONE"; };
      "FloatTitle"                = { bg = "NONE"; };

      # Snacks explorer
      "SnacksExplorerNormal"      = { bg = "NONE"; };
      "SnacksExplorerNormalNC"    = { bg = "NONE"; };
      "SnacksExplorerWinBar"      = { bg = "NONE"; };

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

      # Notify 
      "NotifyBackground"          = { bg = "NONE"; };

      # End of buffer
      "EndOfBuffer"               = { bg = "NONE"; };
    };
  };

}
