
{ pkgs, lib, ... }:

# TODO: 
# - Go through each submodule/plugin one by one and polish each configuration
#   - Make snacks the main component - use all of it 
#     - Replace mini-animate for cursor animations? 
#     - Scroll, but only if it can be configured to not fuck with vim motions
#     - Snacks keymaps to replace native keymap config
#       - Define all keymaps, not just the ones I want to use at the moment
# - Keymaps: 
#   - Ctrl-hjkl in insert mode to replace arrow keys
#   - Tab, Shift+Tab, Enter for blink-cmp completions 
# - Highlights: 
#   - Fix transparency stuff (gitsigns/git gutter lines)
#     - Do this via plugins.transparency, not highlights
# - Neorg for obsidian replacement
# - Configure VimTex 
#   - Auto-save -> auto-compile -> auto-update PDF
#   - Have to use Zathura, or find a way to have PDF viewer inside Neovim
# - Not in Nixvim: 
#   - doodle.nvim (Obsidian graph view)
# - fugit2 (git UI)
# - fidget (?)
# - colorful menu
# - nix
# - otter 
# - Polish lualine 
# - Neoscroll/snacks scroll 
#   - Configure so it doesn't mess with normal vim motions 
# - nvim surround 
# - blink-cmp
# - LSP: change nix lsp from nil_ls -> nixd to add documentation of things (like nixvim)
# - treesitter-textobjects: select inner/outer of functions/classes, jump between them 
# - gitsigns: add line blame 
# - flash for jumping between spots 
# - todo-comments for comments that actually do shit 
# - trouble for diagnostics but better 


{
  programs.nixvim = lib.mkMerge [
    {
      enable = true;
      waylandSupport = true;
      nixpkgs.config.allowUnfree = true;
      performance.byteCompileLua.enable = true;
    }
    (import ./autocommands.nix)
    (import ./colorscheme.nix)
    (import ./extra-configs.nix { inherit pkgs; })
    (import ./highlight.nix)
    (import ./keymaps.nix)
    (import ./options.nix)
    (import ./Plugins/plugins.nix { inherit lib pkgs; })
  ];
}

