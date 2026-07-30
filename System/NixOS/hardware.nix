
{
  hardware = {
    # nvidia = {
    #   open = false;
    #   modesetting.enable = true;
    #   nvidiaSettings = true;
    #   package = config.boot.kernelPackages.nvidiaPackages.stable;
    # };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        Policy = {
          AutoEnable = true;
        };
        LE = {
          MinConnectionInterval = 7;
          MaxConnectionInterval = 9;
          ConnectionLatency = 0;
        };
      };
    };
    logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

}
