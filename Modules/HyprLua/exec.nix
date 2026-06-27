
{ lua, ... }:

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
      "awww-daemon"
      "awww restore"
      "qs"

      "vesktop -m"
    ])
  ];
}
