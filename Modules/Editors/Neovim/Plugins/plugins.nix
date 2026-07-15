
{ lib, pkgs }:

{
  plugins = lib.mkMerge [
    (import ./auto-sessions.nix)
    (import ./blink-cmp.nix)
    (import ./colorizer.nix)
    (import ./conform-nvim.nix)
    (import ./direnv.nix)
    (import ./gitsigns.nix)
    (import ./hardtime.nix)
    (import ./image.nix)
    (import ./lint.nix)
    (import ./lsp.nix { inherit pkgs; })
    (import ./lualine.nix)
    (import ./markview.nix)
    (import ./mini.nix)
    (import ./molten.nix)
    (import ./nerdy.nix)
    (import ./noice.nix)
    (import ./nui.nix)
    (import ./nvim-autopairs.nix)
    # (import ./nvim-r.nix)
    (import ./otter.nix)
    (import ./precognition.nix)
    (import ./snacks.nix)
    (import ./telescope.nix)
    (import ./transparent.nix)
    (import ./treesitter.nix)
    (import ./vimtex.nix { inherit pkgs; })
    (import ./web-devicons.nix)
    (import ./which-key.nix)
  ];
}
