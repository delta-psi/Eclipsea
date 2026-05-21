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
      event = "FileType";
      pattern = "markdown";
      command = "highlight Special guifg=#bbbbbb";
    }
  ];
}
