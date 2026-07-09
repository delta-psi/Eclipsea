
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
    (mkExec "hyprland.start" [
      (if isLaptop then 
        "noctalia-shell -d"
      else
        "awww-daemon"
        "awww restore"
        "qs"
      )
      # "awww-daemon"
      # "awww restore"
      # # "qs"
      # (if isLaptop then "noctalia-shell -d" else "qs")

      "vesktop -m"
    ])
  ];
}
