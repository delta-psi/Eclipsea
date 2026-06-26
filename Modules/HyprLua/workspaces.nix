
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
      on_created_empty = "uwsm -- app spotify";
    }
  ];

}
