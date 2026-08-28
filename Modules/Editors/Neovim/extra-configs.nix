
{ pkgs }:

let 
  render-latex-nvim-src = pkgs.fetchFromGitHub {
    owner = "techwizrd";
    repo = "render-latex.nvim";
    rev = "v0.1.0-rc3";
    hash = "sha256-aPoUVIR9wx/7F7dkzXht6ipm/A+tYYWPrRV21Ixs4Oo=";
  };

  render-latex-worker = pkgs.rustPlatform.buildRustPackage {
    pname = "render-latex-worker";
    version = "v0.1.0-rc3";
    src = render-latex-nvim-src;
    cargoLock = {
      lockFile = "${render-latex-nvim-src}/Cargo.lock";
      outputHashes = {
        "ratex-font-0.1.4" = "sha256-/iYc5D2jnNGmztYsAnHJuV84XkS9E8EbZTE4xHwp9ic=";       
      };
    };
  };
in
{
  extraConfigVim = ''
    let g:vimtex_view_automatic = 1
  '';

  extraPackages = with pkgs; [
    python3Packages.pylatexenc
    neovim-remote  
    fd 
    ghostscript
    trash-cli
    poppler-utils
  ];

  extraPlugins = [
    # pkgs.vimPlugins.vim-commentary
    # (pkgs.vimUtils.buildVimPlugin {
    #   pname = "typst-preview.nvim";
    #   version = "unstable-2026-08-20";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "al-kot";
    #     repo = "typst-preview.nvim";
    #     rev = "59028097432682e8f619ed61b24333c6e5f79a97"; 
    #     hash = "sha256-/zrxxTsw1R2phmTgW8fD8UWaMEMxNsYA3TYbmWQRGDw=";
    #   };
    #   postPatch = ''
    #     substituteInPlace lua/typst-preview/preview.lua \
    #       --replace 'vim.o.shell, vim.o.shellcmdflag, cmd' '"/bin/sh", "-c", cmd'
    #   '';
    # })
  ];

  extraConfigLua = ''

    
    -- 1. Debounced "live write" so typst watch recompiles as you type,
    --    not just when you :w.
    local typst_write_timer = nil

    local function schedule_typst_write()
      if typst_write_timer then
        typst_write_timer:stop()
        typst_write_timer:close()
      end
      typst_write_timer = (vim.uv or vim.loop).new_timer()
      typst_write_timer:start(400, 0, vim.schedule_wrap(function()
        if vim.bo.filetype == "typst" and vim.bo.modified then
          vim.cmd("silent! noautocmd update")
        end
      end))
    end

    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      pattern = "*.typ",
      group = vim.api.nvim_create_augroup("TypstLiveWrite", { clear = true }),
      callback = schedule_typst_write,
    })

    -- 2. On opening a .typ file: open a kitty split running `typst watch`
    --    in the background and bookokrat in the foreground, then flip on
    --    bookokrat's file-watching toggle automatically.
    local function open_typst_preview()
      -- only meaningful if Neovim itself is running inside kitty
      if vim.env.KITTY_WINDOW_ID == nil then
        return
      end
      -- don't relaunch a pane every time you re-enter the buffer
      if vim.b.typst_preview_started then
        return
      end
      vim.b.typst_preview_started = true

      local file = vim.fn.expand("%:p")
      local pdf = vim.fn.expand("%:p:r") .. ".pdf"
      local dir = vim.fn.expand("%:p:h")
      local log = "/tmp/typst-watch-" .. vim.fn.fnamemodify(pdf, ":t:r") .. ".log"

      local inner_cmd = string.format(
        "typst watch %s %s >%s 2>&1 & sleep 0.3; exec bookokrat %s",
        vim.fn.shellescape(file), vim.fn.shellescape(pdf),
        vim.fn.shellescape(log), vim.fn.shellescape(pdf)
      )

      -- run synchronously (near-instant) so we get the new window's id back
      local wid = vim.trim(vim.fn.system({
        "kitten", "@", "launch",
        "--location=vsplit",
        "--cwd", dir,
        "--keep-focus",
        "--title", "typst-preview",
        "sh", "-c", inner_cmd,
      }))

      -- give bookokrat a moment to load the PDF, then toggle file watching on
      -- (Space+w) so you don't have to press it by hand every time.
      -- Bump the delay if it doesn't reliably land on larger PDFs.
      vim.defer_fn(function()
        vim.fn.jobstart({
          "kitten", "@", "send-text", "--match", "id:" .. wid, " w",
        }, { detach = true })
      end, 1500)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "typst",
      group = vim.api.nvim_create_augroup("TypstPreview", { clear = true }),
      callback = open_typst_preview,
    })

    -- local function open_typst_preview()
    --   -- only makes sense if Neovim itself is running inside kitty
    --   if vim.env.KITTY_WINDOW_ID == nil then
    --     return
    --   end
    --   -- don't relaunch a pane every time you re-enter the buffer
    --   if vim.b.typst_preview_started then
    --     return
    --   end
    --   vim.b.typst_preview_started = true
    --
    --   local file = vim.fn.expand("%:p")
    --   local pdf = vim.fn.expand("%:p:r") .. ".pdf"
    --   local dir = vim.fn.expand("%:p:h")
    --   local log = "/tmp/typst-watch-" .. vim.fn.fnamemodify(pdf, ":t:r") .. ".log"
    --
    --   local shell_cmd = string.format(
    --     "typst watch %q %q >%q 2>&1 & sleep 0.3; exec bookokrat %q",
    --     file, pdf, log, pdf
    --   )
    --
    --   vim.fn.jobstart({
    --     "kitten", "@", "launch",
    --     "--location=vsplit",
    --     "--cwd", dir,
    --     "--keep-focus",
    --     "--title", "typst-preview",
    --     "sh", "-c", shell_cmd,
    --   }, { detach = true })
    -- end
    --
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "typst",
    --   group = vim.api.nvim_create_augroup("TypstPreview", { clear = true }),
    --   callback = open_typst_preview,
    -- })
    --
    -- local typst_write_timer = nil
    --
    -- local function schedule_typst_write()
    --   if typst_write_timer then
    --     typst_write_timer:stop()
    --     typst_write_timer:close()
    --   end
    --   typst_write_timer = (vim.uv or vim.loop).new_timer()
    --   typst_write_timer:start(400, 0, vim.schedule_wrap(function()
    --     if vim.bo.filetype == "typst" and vim.bo.modified then
    --       vim.cmd("silent! noautocmd update")
    --     end
    --   end))
    -- end
    --
    -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    --   pattern = "*.typ",
    --   group = vim.api.nvim_create_augroup("TypstLiveWrite", { clear = true }),
    --   callback = schedule_typst_write,
    -- })
    --

    -- require("typst-preview").setup({
    --   preview = {
    --     max_width = 150,
    --     ppi = 144,
    --     position = "right";
    --   },
    --   statusline = {
    --     enabled = true, -- Show statusline
    --     compile = { -- Last compilation status
    --       ok = { icon = "", color = "#a6da95" },
    --       ko = { icon = "", color = "#ed8796" },
    --     },
    --     page_count = { -- Page count
    --       color = "#c6a0f6",
    --     },
    --   },
    -- })

    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.tex_flavor = 'latex'
    
    vim.api.nvim_create_autocmd("User", {
      pattern = "MarkviewUpdate",
      callback = function()
        if vim.bo.filetype == "markdown" then
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = "nc"
        end
      end
    })

    vim.opt.runtimepath:append("${render-latex-nvim-src}")
    vim.defer_fn(function ()
      require("render_latex").setup({
        install = { auto = false, version = "v0.1.0-rc3" },
        worker = {
          bin = "${render-latex-worker}/bin/render-latex-worker",
        },
        render = {
          preset = "presentation",
          inline = "conceal",
          inline_symbols = true,
          hide_on_cmdline = false,
        },
        image = {
          backend = "kitty",
        },
      })
      require("render_latex").refresh()
    end, 100)


    -- require("plenary").setup()
    -- require("markdown-latex-render").setup()
    -- require("volt").setup()
    -- require("triforce").setup()
    -- require("typr").setup()
  '';
}
