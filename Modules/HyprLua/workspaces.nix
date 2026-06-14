
{ vars, ... }:

{
  workspace_rule = [
    {
      workspace = "special:idle";
      xray = true;
      on-created-empty = "kitty --class idle-term ${vars.idle}";
    }
    {
      workspace = "special:systemStats";
      xray = true;
      on-created-empty = "kitty --class btop-term btop";
    }
    {
      workspace = "special:clock";
      xray = true;
      on-created-empty = "kitty --class clock-term era";
    }
  ];

}
