
{ lua, ... }:

let 
  mkExec = event: cmds: {
    _args = [
      event 
      (lua ''
        function()
          ${builtins.concatStringsSep "\n" (map (cmd: ''hl.exec_cmd("${cmd}")'') cmds)}
      '')
    ];
  };
in
{
  on = mkExec "hyprland.start" [
    "awww-daemon"
    "awww restore"
    "qs"
  ];
}

  # on = {
  #   _args = [
  #     "hyprland.start"
  #     (lua ''
  #       function()
  #         hl.exec_cmd("awww-daemon")
  #         hl.exec_cmd("awww restore")
  #         hl.exec_cmd("qs")
  #     '')
  #   ];
  # };
  # exec-once = [
  #   # Cursors 
  #   "hyprctl setcursor Sweet-cursors 24"
  #   "gsettings set org.gnome.desktop.interface cursor-theme 'Sweet-cursors'"
  #   "gsettings set org.gnome.desktop.interface cursor-size 24"
  #
  #   # Startup
  #   "awww-daemon &"
  #   # "awww img --transition-type wave --transition-step 90 /home/delta/Pictures/Wallpapers/anime-petals-in-water.jpg"
  #   "awww restore"
  #   "qs"
  # ];

# }

