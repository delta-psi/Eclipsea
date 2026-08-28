# Neovim Autocommands

{
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
    {
      event = [ "FileType" ];
      pattern = "markdown";
      command = "highlight Special guifg=#bbbbbb";
    }
    # {
    #   event = [ "FileType" ];
    #   pattern = "typst";
    #   callback.__raw = ''
    #     function()
    #       require("typst-preview").start()
    #     end
    #   '';
    # }
    {
      event = [ "FileType" ];
      pattern = [ "typst" ];
      callback.__raw = ''
        function(args)
          local buf = args.buf
          local file = vim.api.nvim_buf_get_name(buf)

          if file == "" then return end

          local pdf_file = file:gsub("%.typ$", ".pdf")

          local function compile_now()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local job = vim.fn.jobstart({"typst", "compile", "-", pdf_file}, {
              writer = lines,
              stdout_buffered = true,
              stderr_buffered = true,
            })
          end
          
          compile_now()

          if not vim.b[buf].bookokrat_started then
            vim.b[buf].bookokrat_started = true
            vim.defer_fn(function()
              local cmd = string.format("kitty @ launch --location=vsplit --no-response bookokrat '%s;", pdf_file)
              vim.fn.system(cmd)
            end, 200)
          end

          local group = vim.api.nvim_create_augroup("TypstLivePreview_" .. buf, { clear = true })

          vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
            group = group,
            buffer = buf,
            callback = function()
              if vim.b[buf].compile_timer then
                vim.fn.timer_stop(vim.b[buf].compile_timer)
              end

              vim.b[buf].compile_timer = vim.fn.timer_start(50, function()
                compile_now()
              end)
            end,
          })
        end
      '';
    }
    {
      event = [ "FileType" ];
      pattern = [ "markdown" "text" "latex" "tex" "gitcommit" ];
      callback.__raw = ''
        function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.breakindent = true
          vim.opt_local.breakindentopt = "shift:2"
          vim.opt_local.showbreak = "↳ "
          vim.opt_local.breakat = " ^I"
        end
      '';
    }
    {
      event = [ "ColorScheme" "VimEnter" ];
      pattern = [ "*" ];
      callback = {
        __raw = ''
          function()
            -- Sets $ and $$ delimiters to a distinct accent color (e.g., cyan/grey)
            vim.api.nvim_set_hl(0, "RenderMarkdownMathInline", { fg = "#7ca6b0", bold = true })
            -- Define standard math style (inherits Normal color + adds Italic)
            -- local math_style = { link = "Normal", italic = true }
            local math_style = { italic = true }
            -- Base math capture groups
            vim.api.nvim_set_hl(0, "@markup.math", math_style)
            vim.api.nvim_set_hl(0, "@markup.math.latex", math_style)

            -- Force operators, brackets, keywords, and functions inside LaTeX to match body text
            vim.api.nvim_set_hl(0, "@operator.latex", math_style)
            vim.api.nvim_set_hl(0, "@punctuation.bracket.latex", math_style)
            vim.api.nvim_set_hl(0, "@punctuation.delimiter.latex", math_style)
            vim.api.nvim_set_hl(0, "@keyword.latex", math_style)
            vim.api.nvim_set_hl(0, "@function.latex", math_style)
            vim.api.nvim_set_hl(0, "@string.latex", math_style)
            vim.api.nvim_set_hl(0, "@character.special.latex", math_style)

            -- Style paired math delimiters ($ and $$) differently
            -- Replace "#7ca6b0" or "Comment" with your preferred accent color/group
            local delimiter_style = { fg = "#7ca6b0", bold = true, italic = true }

            vim.api.nvim_set_hl(0, "@markup.math.delimiter", delimiter_style)
            vim.api.nvim_set_hl(0, "@punctuation.delimiter.markdown", delimiter_style)
          end
        '';
      };
    }
  ];
}
