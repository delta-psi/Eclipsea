
{
  blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "none";
        "<Tab>" = [ "select_next" "snippet_forward" "fallback" ];
        "<S-Tab>" = [ "select_prev" "snippet_backward" "fallback" ];
        "<CR>" = [ "accept" "fallback" ];
        "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-e>" = [ "hide" "fallback" ];
      };
      signature.enabled = true;
      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
            # semantic_token_resolution.enabled = false;
          };
        };
        documentation = {
          auto_show = true;
          window.border = "rounded";
        };
        ghost_text.enabled = true;
        menu = {
          border = "rounded";
          draw.treesitter = [ "lsp" ];
        };
      };
    };
  };
}
