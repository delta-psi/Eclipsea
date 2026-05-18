
{ pkgs, ... }:

# TODO: 
# - markview or render-markdown 
#   - obsidian.nvim?
#   - Neorg for obsidian replacement!!
# - Configure VimTex 
#   - Auto-save -> auto-compile -> auto-update PDF
#   - Have to use Zathura, or find a way to have PDF viewer inside Neovim
# - Not in Nixvim: 
#   - doodle.nvim (Obsidian graph view)
#   - mdmath.nvim (Inline LaTeX rendering using Kitty Graphics Protocol)
#   - makrdown-latex-render (best embedded LaTeX renderer for Markdown in Neovim)
# - fugit2 (git UI)
# - flash (?)
# - fidget (?)
# - colorful menu
# - nix
# - otter 
# - Customize lualine, bufferline/tabs 
#   - Lualine theme based on bubbles 
# - Neoscroll/snacks scroll 
#   - Configure so it doesn't mess with normal vim motions 
# - nvim surround 
# - blink-cmp? 
# - LSP: change nix lsp from nil_ls -> nixd to add documentation of rthings (like nixvim)
# - treesitter-textobjects: select inner/outer of functions/classes, jump between them 
# - gitsigns: add line blame 
# - flash for jumping between spots 
# - todo-comments for comments that actually do shit 
# - trouble for diagnostics but better 



{
  programs.nixvim = {
    enable = true;
    waylandSupport = true;
    nixpkgs.config.allowUnfree = true;
    performance.byteCompileLua.enable = true;
    colorschemes = import ./colorscheme.nix; 
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
      
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = {
              __raw = ''
                (function()
                  local colors = {
                    blue   = '#80a0ff',
                    cyan   = '#79dac8',
                    black  = '#080808',
                    white  = '#c6c6c6',
                    red    = '#ff5189',
                    violet = '#d183e8',
                    grey   = '#303030',
                  }
                  return {
                    normal = {
                      a = { fg = colors.black,  bg = colors.violet, gui = "italic,bold" },
                      b = { fg = colors.white,  bg = colors.grey, gui = "italic" },
                      c = { fg = colors.white, gui = "italic" },
                    },
                    insert  = { a = { fg = colors.black, bg = colors.blue, gui = "italic,bold" } },
                    visual  = { a = { fg = colors.black, bg = colors.cyan, gui = "italic,bold" } },
                    replace = { a = { fg = colors.black, bg = colors.red, gui = "italic,bold" } },
                    inactive = {
                      a = { fg = colors.white, bg = colors.black, gui = "italic" },
                      b = { fg = colors.white, bg = colors.black, gui = "italic" },
                      c = { fg = colors.white, gui = "italic" },
                    },
                  }
                end)()
              '';
            };
            component_separators = "";
            section_separators = {
              left  = "";
              right = "";
            };
          };
          sections = {
            lualine_a = [
              { __unkeyed-1 = "mode"; separator = { left = ""; }; right_padding = 2; }
            ];
            lualine_b = [ "filename" "branch" ];
            lualine_c = [ "fileformat" ];
            lualine_x = [ "diff" ];
            lualine_y = [ "filetype" "encoding" ];
            lualine_z = [
              { __unkeyed-1 = "location"; separator = { right = ""; }; left_padding = 2; }
            ];
          };
          inactive_sections = {
            lualine_a = [ "filename" ];
            lualine_b = [];
            lualine_c = [];
            lualine_x = [];
            lualine_y = [];
            lualine_z = [ "location" ];
          };
          tabline = {
            lualine_a = [
              { __unkeyed-1 = "buffers"; separator = { left = ""; right = ""; }; } 
            ];
            lualine_b = [];
            lualine_c = [];
            lualine_x = [];
            lualine_y = [];
            lualine_z = [
              # { __unkeyed-1 = "tabs"; separator = { left = ""; right = ""; }; }
            ];
          };
        };
      };
      colorizer.enable = true;
      hardtime.enable = true;
      precognition.enable = true;

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
        # keymaps = {
        #   "<leader>ff" = "find_files";
        #   "<leader>fg" = "live_grep";
        # };
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

      # lspkind = {
      #   enable = true;
      #   cmp.enable = true;
      # };

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

      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            documentation = {
              auto_show = true;
            };
          };
        };
      };
      # cmp = {
      #   enable = true;
      #   autoEnableSources = true;
      #   settings = {
      #     sources = [
      #       { name = "nvim_lsp"; }
      #       { name = "path"; }
      #       { name = "buffer"; }
      #       { name = "luasnip"; }
      #     ];
      #     mapping = {
      #       "<C-space>" = "cmp.mapping.complete()";
      #       "<CR>" = "cmp.mapping.confirm({ select = true })";
      #       "<Tab>" = "cmp.mapping.select_next_item()";
      #       "<S-Tab>" = "cmp.mapping.select_prev_item()";
      #     };
      #   };
      # };

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

      bufferline = {
        enable = false;
        settings = {
          highlights = {
                  # Fill bar background (the empty space between/around tabs)
            fill = {
              bg = "#080808";  # black
            };

            # Unselected tabs
            background = {
              fg = "#c6c6c6";  # white
              bg = "#303030";  # grey
            };

            # Selected tab
            buffer_selected = {
              fg = "#080808";  # black
              bg = "#d183e8";  # violet
              bold = true;
              italic = true;
            };

            # Visible but not selected (e.g. in a split)
            buffer_visible = {
              fg = "#c6c6c6";  # white
              bg = "#303030";  # grey
            };

            # Separators for unselected tabs
            separator = {
              fg = "#080808";  # matches fill — outer curve blends into bar
              bg = "#303030";  # matches background — inner curve blends into tab
            };

            # Separators for selected tab
            separator_selected = {
              fg = "#080808";  # matches fill
              bg = "#d183e8";  # matches selected tab
            };

            # Separators for visible but unfocused tabs
            separator_visible = {
              fg = "#080808";  # matches fill
              bg = "#303030";  # matches background
            };

            # The little indicator line under the selected tab
            indicator_selected = {
              fg = "#d183e8";  # violet
              bg = "#d183e8";  # violet — hides it so the pill shape is clean
            };

            # Modified (unsaved) indicator dots
            modified = {
              fg = "#ff5189";  # red, matching lualine's red
              bg = "#303030";
            };
            modified_selected = {
              fg = "#ff5189";  # red
              bg = "#d183e8";  # violet
            };
            modified_visible = {
              fg = "#ff5189";
              bg = "#303030";
            };

            # Close buttons
            close_button = {
              fg = "#c6c6c6";
              bg = "#303030";
            };
            close_button_selected = {
              fg = "#080808";
              bg = "#d183e8";
            };
            close_button_visible = {
              fg = "#c6c6c6";
              bg = "#303030";
            };

            # Tab (if you have tabpages enabled)
            tab = {
              fg = "#c6c6c6";
              bg = "#303030";
            };
            tab_selected = {
              fg = "#080808";
              bg = "#d183e8";
              bold = true;
            };
            tab_separator = {
              fg = "#080808";
              bg = "#303030";
            };
            tab_separator_selected = {
              fg = "#080808";
              bg = "#d183e8";
            };
            tab_close = {
              fg = "#c6c6c6";
              bg = "#080808";
            };
          };
          #   buffer_selected = {
          #     bg = "#363a4f";
          #   };
          #   fill = {
          #     bg = "#1e2030";
          #   };
          #   numbers_selected = {
          #     bg = "#363a4f";
          #   };
          #   separator = {
          #     fg = "#13e4d6";
          #     bg = "#1e2030";
          #   };
          #   separator_selected = {
          #     fg = "#13e4d6";
          #     bg = "#363a4f";
          #   };
          #   separator_visible = {
          #     fg = "#1e2030";
          #     bg = "#1e2030";
          #   };
          #   tab_selected = {
          #     bg = "#13e4d6";
          #   };
          # };
          options = {
            # separator_style = ["" ""];
            separator_style = [
              ""
              ""
            ];
          };
        };
      };

      which-key = {
        enable = true;
        settings = {
          preset = "helix";
          delay = 300;
          win = {
            border = "rounded";
            padding = [ 1 2 ];
            # wo = {
            #   winblend = 10;
            # };
          };
          icons = {
            mappings = true;
            group = "+";
            breadcrumb = "»";
            separator = "➜";
          };
          show_help = true;
          show_keys = true;

        };
      };

      nerdy = {
        enable = true;
        enableTelescope = true;
      };

      nui = {
        enable = true;
      };

      # notify = {
      #   enable = true;
      #   settings = "#00000000";
      #   stages = "fade";
      #   timeout = "3000";
      # };

      noice = {
        enable = true;
        autoLoad = true;
        settings = {
          presets = {
            bottom_search = false;
            command_palette = true;
            inc_rename = false;
            long_message_to_split = false;
            lsp_doc_border = true;
          };
          cmdline = {
            enabled = true;
            view = "cmdline_popup";
          };
          messages = {
            enabled = true;
          };
          notify = {
            enabled = true;
          };
          popupmenu = {
            enabled = true;
            backend = "nui";
            kind_icons = { };
          };
          views = {
            cmdline_popup = {
              position = {
                row = "50%";
                col = "50%";
              };
              size = {
                width = 60;
                height = "auto";
              };
            };
            popupmenu = {
              relative = "editor";
              zindex = 65;
              position = {
                row = "53%";
                col = "50%";
              };
              size = {
                width = 60;
                height = "auto";
                max_height = 10;
              };
              border = {
                style = "rounded";
                padding = [ 0 1 ];
              };
              win_options = {
                winhighlight = {
                  Normal = "NormalFloat";
                  FloatBorder = "FloatBorder";
                };
              };
            };
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
      wildoptions = "pum";
      winborder = "rounded";
      # pumheight = 10;
      wildmode = "longest:full,full";
      completeopt = [ "menu" "menuone" "noselect" "noinsert" ];
      fillchars = {
        eob = " ";
      };
    };

    keymaps = [
      { mode = "n"; key = "<S-l>"; action = ":bnext<cr>"; options.desc = "Next Buffer"; }
      { mode = "n"; key = "<S-h>"; action = ":bprev<cr>"; options.desc = "Previous Buffer"; }

      { mode = "n"; key = "<leader>v"; action = "<cmd>vsplit<cr>"; options.desc = "Vertical Split"; }
      { mode = "n"; key = "<leader>s"; action = "<cmd>split<cr>"; options.desc = "Horizontal Split"; }

      { mode = "n"; key = "<leader>e"; action = "<cmd>lua Snacks.explorer()<cr>"; options.desc = "File Tree"; }
      { mode = [ "n" "t" ]; key = "<C-\\>"; action = "<cmd> lua Snacks.terminal.toggle()<cr>"; options.desc = "Toggle Terminal"; } 
      { mode = "n"; key = "<leader>bd"; action = "<cmd> lua Snacks.bufdelete()<cr>"; options.desc = "Delete current buffer"; }
      # { mode = "n"; key = "<leader>lr"; action.__raw = ''function() require("markdown-latex-render.render").rerender_buf() end''; }
      { mode = "n"; key = "<leader><space>"; action = "<cmd>lua Snacks.picker.smart()<cr>"; options.desc = "File Explorer"; }
      { mode = "n"; key = "<leader>h"; action = "<cmd>lua Snacks.notifier.show_history()<cr>"; options.desc = "Show notifcations history"; }

      # Resize with arrows
      { mode = "n"; key = "<C-Up>"; action = "<cmd>resize -2<cr>"; }
      { mode = "n"; key = "<C-Down>"; action = "<cmd>resize +2<cr>"; }
      { mode = "n"; key = "<C-Left>"; action = "<cmd>vertical resize -2<cr>"; }
      { mode = "n"; key = "<C-Right>"; action = "<cmd>vertical resize +2<cr>"; }

      { mode = "n"; key = "<leader>d"; action = "<cmd>lua vim.diagnostic.open_float()<cr>"; options.desc = "Show Diagnostic"; }
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

    extraPlugins = with pkgs.vimUtils; [
      # (buildVimPlugin {
      #   name = "plenary";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "nvim-lua";
      #     repo = "plenary.nvim";
      #     rev = "HEAD";
      #     sha256 = "sha256-nkfETDkPiE+Kd2BWYZijgUp9bP8RgFwRmvqJz2BMuq4=";
      #   };
      #   doCheck = false;
      # })
      # (buildVimPlugin {
      #   name = "markdown-latex-render.nvim";
      #   pname = "markdown-latex-render.nvim";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "Prometheus1400";
      #     repo = "markdown-latex-render.nvim";
      #     rev = "HEAD";
      #     sha256 = "sha256-66QMvQ4dTf1GYGfScH0AvuvoZdUqOnqDhCYxNPmAC6Q=";
      #   };
      #   doCheck = false;
      # })
      # (buildVimPlugin {
      #   name = "triforce.nvim";
      #   pname = "triforce.nvim";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "gisketch";
      #     repo = "triforce.nvim";
      #     rev = "HEAD";
      #     sha256 = "sha256-YY+bq5TuVhl+P2poOYN7k9eLp7SE+nM/hkLF3375eOE=";
      #   };
      #   doCheck = false;
      # })
      # (buildVimPlugin {
      #   name = "volt";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "nvzone";
      #     repo = "volt";
      #     rev = "HEAD";
      #     sha256 = "sha256-5Xao1+QXZOvqwCXL6zWpckJPO1LDb8I7wtikMRFQ3Jk=";
      #   };
      # })
      # (buildVimPlugin {
      #   name = "typr";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "nvzone";
      #     repo = "typr";
      #     rev = "HEAD";
      #     sha256 = "sha256-PNkoz91RmlZnRrdStAz5b7pGaWv27UOQU/9abYNP/5E=";
      #   };
      #   doCheck = false;
      # })
    ];

    extraConfigLua = ''
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.tex_flavor = 'latex'

      -- require("plenary").setup()
      -- require("markdown-latex-render").setup()
      -- require("volt").setup()
      -- require("triforce").setup()
      -- require("typr").setup()
    '';

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
      {
        event = [ "CursorHold" ];
        callback.__raw = "function() vim.diagnostic.open_float(nil, { focus = false }) end";
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
      # "NotifyBackground"          = { bg = "NONE"; };

      # End of buffer
      "EndOfBuffer"               = { bg = "NONE"; };
    };
  };

}
