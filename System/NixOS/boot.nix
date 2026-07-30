
{ pkgs, ... }:

{
  # Bootloader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto;
    # kernelModules = [
    #   "nvidia"
    #   "nvidia_modeset"
    #   "nvidia_uvm"
    #   "nvidia_drm"
    # ];
    kernelParams = [
      # "video=2560x1080@60"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      # "nvidia_drm.modeset=1"
      # "nvidia_drm.fbdev=1"
      # "nvidia.NVred_PreserveVideoMemoryAllocations=1"
      # "fbcon=nodefer"
    ];
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
      	(adi1090x-plymouth-themes.override {
	        selected_themes = [ "lone" ];
	      })
      ];
    };
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    loader.timeout = 0;
  };


}
