
{
  conform-nvim = {
    enable = true;
    formattersByFt = {
      python = [ "black" ];
      c = [ "clang-format" ];
      cpp = [ "clang-format" ];
      qml = [ "qmlformat" ];
    };
  };
}
