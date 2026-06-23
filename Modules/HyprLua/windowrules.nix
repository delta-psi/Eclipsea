
{ ... }: 

{
  window_rule = [
    {
      name = "mini-term";
      match.class = "^(kitty-floating)$";
      float = true;
      center = true;
      # size = "{600, 550}";
      border_color = "rgba(00eaffff) rgba(a020f0ff) 45deg";
      animation = "emphasizedAccel";
      opacity = "0.90";
    }
  ];
}
