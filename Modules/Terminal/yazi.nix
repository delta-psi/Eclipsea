
{ ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    keymap = {
      mgr.prepend_keymap = [
        {
          on = ["w"];
          desc = "Set as wallpaper";
          run = ''shell -- fish -ic 'wall $argv' "$(basename %h)"'';
        }
      ];
    };
  };
}
