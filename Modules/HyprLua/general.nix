
{ ... }:

{
  general = {
    border_size = 4;
    gaps_in = 8;
    gaps_out = 16;
    "col.inactive_border" = "rgba(ffffff33)"; # 22
    # "col.active_border" = lua ''{ colors = { "rgba(00eaffff)", "rgba(a020f0ff)" }, angle = 45 }'';
    layout = "dwindle";
    allow_tearing = false;
    snap = {
      enabled = true;
    #   window_gap = ;
    #   monitor_gap = ;
    #   border_overlap = ;
    #   respect_gaps = ;
    };
  };

  dwindle = {
    preserve_split = true;
    # pseudotile = true;
    smart_split = false;
    smart_resizing = true;
  };

  input = {
    touchpad = {
      # flip_y = true;
      natural_scroll = true;
    };
  };
}

