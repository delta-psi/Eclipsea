
{
  mini = {
    enable = true;
    modules.animate = {
      open.enable = false;
      close.enable = false;
      cursor = {
        enable = true;
        timing = {
          __raw = ''
            require("mini.animate").gen_timing.linear({ duration = 5 })
          '';
        };
      };
      scroll = {
        enable = true;
        timing = {
          __raw = ''
            require("mini.animate").gen_timing.linear({ duration = 5 })
          '';
        };
      };
    };
  };
}
