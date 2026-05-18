# Hyprland Animations
# ==============================================================


{ ... }: 

{
  animations = {
    enabled = true;
    workspace_wraparound = false;
    _beziers.bezier = [
      "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
      "emphasizedAccel, 0.3, 0, 0.8, 0.15"
      "emphasizedDecel, 0.05, 0.7, 0.1, 1"
      "overShoot, 0.05, 0.95, 0.05, 1.1"
      # "pop, 1, -0.3, 0.9, 0.1"
      "pop, 0.5, -0.3, 1, 1"
      "standard, 0.2, 1, 0.5, 1"
      # "popClose, 0.25, 1.4, 0.5, 1"
      "smoothMove, 0.3, 0.85, 0.4, 1"
    ];
    animation = [
      "layersIn, 1, 5, emphasizedDecel, slide"
      "layersOut, 1, 4, emphasizedAccel, slide"
      "fadeLayers, 1, 5, standard"
      "windowsIn, 1, 5, overShoot"
      "windowsOut, 1, 3, pop"
      "windowsMove, 1, 6, standard"
      "workspaces, 1, 5, standard"
      "specialWorkspace, 1, 4, specialWorkSwitch, slidefadevert 15%"
      "fade, 1, 6, standard"
      "fadeDim, 1, 6, standard"
      "border, 1, 6, standard"
    ];
  };
}
