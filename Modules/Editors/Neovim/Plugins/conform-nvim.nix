
{
  conform-nvim = {
    enable = true;
    settings.formatters_by_ft = {
      python = [ "black" ];
      c = [ "clang-format" ];
      cpp = [ "clang-format" ];
      qml = [ "qmlformat" ];
    };
  };
}
