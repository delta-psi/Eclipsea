
{ pkgs }:

{
  vimtex = {
    enable = true;
    texlivePackage = pkgs.texlive.combined.scheme-full;
    zathuraPackage = pkgs.zathura;
    settings = {
      compiler_method = "latexmk";
      # view_method = "zathura";
      view_automatic = 1;
      view_method = "general";
      view_general_viewer = "kitty";
      view_general_options = "@ launch --location=vsplit --cwd=current bookokrat @pdf";
      view_general_cmd = "bookokrat --synctex-forward @line:@col:@tex @pdf";
      # view_general_options = "--forward-line=@line --forward-file=@tex @pdf";
      # view_general_cmd = "bookokrat --synctex-forward @line:@col:@tex @pdf";
      quickfix_open_on_warning = 0;
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
}
