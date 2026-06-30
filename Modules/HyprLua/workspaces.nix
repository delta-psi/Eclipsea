
{ vars, ... }:

{
  workspace_rule = [
    {
      workspace = "special:idle";
      on_created_empty = "kitty --class idle-term ${vars.idle}";
    }
    {
      workspace = "special:systemStats";
      on_created_empty = "kitty --class btop-term btop";
    }
    {
      workspace = "special:clock";
      on_created_empty = "kitty --class clock-term era";
    }
    {
      workspace = "special:music";
      on_created_empty = "uwsm -- app ${vars.music}";
    }
    {
      workspace = "special:comms";
      on_created_empty = "uwsm -- app ${vars.comms}";
    }
    {
      workspace = "special:typing";
      on_created_empty = "kitty --class typing tukai";
    }
  ];

}
