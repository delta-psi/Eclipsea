
{ pkgs, ... }:

{
  services = {
    
    # Scheduler
    scx = {
      enable = true;
      scheduler = "scx_rustland";
    };

    # OpenSSH Daemon
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = true;
      };
    };

    # Tailscale (Mesh VPN)
    tailscale = {
      enable = true;
    };

    # Mounting & External Drives
    gvfs = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };

    # Keymap in x11
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Bluetooth
    blueman = {
      enable = true;
    };

    # Vial for split keyboard
    udev = {
      packages = with pkgs; [
        qmk 
        qmk-udev-rules
        qmk_hid
        via
        vial
      ];
    };

    # Enable SDDM login
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = false;
        package = pkgs.kdePackages.sddm;
        # theme = "Elegant";
        settings = {
          Theme.CursorTheme = "Sweet-cursors";
        };
        # extraPackages = with pkgs; [
        #   elegant-sddm
        # ];
      };
    };
  };

}
