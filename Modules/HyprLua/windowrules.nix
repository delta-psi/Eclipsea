
# Add: 
#   - Window floating toggle -> specified size 
#   - When only one window on screen, make it centered, not taking up the full monitor; when second window opens, reverts back to 'normal' tiling layout

{ ... }: 

{
  window_rule = [
    {
      name = "mini-term";
      match.class = "^(kitty-floating)$";
      float = true;
      center = true;
      size = "{600, 550}";
      border_color = "rgba(00eaffff) rgba(a020f0ff) 45deg";
      animation = "emphasizedAccel";
      opacity = "0.90";
    }
    {
      name = "mini-float";
      match.float = true;
      # center = true;
      # size = "1200 800";
      size = "{900, 550}";
      max_size = "{900, 550}";
    }
    {
      name = "wifitui-float";
      match.class = "^(wifitui-floating)";
      float = true;
      center = true;
      size = "{900, 550}";
      max_size = "{900, 550}";
    }
    {
      name = "wiremix-float";
      match.class = "^(wiremix-floating)";
      float = true;
      center = true;
      size = "{550, 900}";
      max_size = "{550, 900}";
    }
    {
      name = "wallpaper";
      match.class = "^(wallpaper-selector)";
      float = true;
      center = true;
      size = "{900, 550}";
      max_size = "{900, 550}";
    }
  ];
}
