
{ pkgs }:

{
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
}
