# Hyprland Workspaces
# ==============================================================


{ ... }:

{
  workspace = [
    "special:idle, xray:true, on-created-empty: kitty --class idle-term $idle"
    "special:systemStats, xray:true, on-created-empty: kitty --class btop-term btop"
    "special:clock, xray:true, on-created-empty: kitty --class clock-term era"
  ];
}
