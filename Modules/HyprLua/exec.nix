
{ lua, isLaptop, ... }:

let 
  mkExec = event: cmds: {
    _args = [
      event 
      (lua ''
        function()
          ${builtins.concatStringsSep "\n" (map (cmd: ''hl.exec_cmd("${cmd}")'') cmds)}
        end
      '')
    ];
  };
in
{
  on = [
    (if isLaptop then
      (mkExec "hyprland.start" [
        "noctalia-shell -d"
        "vesktop -m"
      ])
    else
      (mkExec "hyprland.start" [
        "awww-daemon"
        "awww restore"
        "qs"
      ]))
  ];
  # )
  # on = [ 
    # (mkExec "hyprland.start" [
    #   (if isLaptop then 
    #     [ "noctalia-shell -d" ]
    #   else
    #     ''"awww-daemon" "awww restore" "qs"''
    #   )
      # "awww-daemon"
      # "awww restore"
      # # "qs"
      # (if isLaptop then "noctalia-shell -d" else "qs")

  #     "vesktop -m"
  #   ])
  # ];
}
