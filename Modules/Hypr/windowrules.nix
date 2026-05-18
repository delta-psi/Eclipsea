# Hyprland Window Rules 
# ==============================================================


{ ... }: 

{
  windowrule = {
    name = "mini-term";
    "match:class" = "^(kitty-floating)$";
    float = "on";
    # size = "60% 60%";
    center = "on";
    pin = "on";
    border_color = "rgba(00eaffff) rgba(a020f0ff) 45deg";
    # dim_around = "on";
    animation = "emphasizedAccel";
    opacity = "0.90";
  };

}
