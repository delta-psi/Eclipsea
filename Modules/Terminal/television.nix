
{ ... }:

{
  programs.television = {
    enable = true;
    enableFishIntegration = true;
    # themes = {};
    settings = {
      use_nerd_font_icons = true;
      ui = {
        theme = "matugen";
      };
    };
    channels = {
      tldr = {
        metadata = {
          name = "tldr";
          description = "Browse & preivew TLDR help pages";
          requirements = [ "tealdeer" ];
        };
        preview = {
          command = "tldr '{}'";
        };
        source = {
          command = "tldr --list";
        };
        keybindings = {
          "ctrl-e" = "actions:open";
        };
        actions.open = {
          description = "Open TLDR page in pager";
          command = "tldr '{}' | less";
          mode = "fork";
        };
      };
    };
  };
}
