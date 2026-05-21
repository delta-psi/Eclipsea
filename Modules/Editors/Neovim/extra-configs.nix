
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
  ];

  extraPlugins = [
    # pkgs.vimPlugins.vim-commentary
  ];

  extraConfigLua = ''
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
