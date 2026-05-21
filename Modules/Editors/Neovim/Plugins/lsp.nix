
{ pkgs }:

{
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


}
