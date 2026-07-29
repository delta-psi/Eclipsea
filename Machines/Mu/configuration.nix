{ pkgs, ... }: 

{

  # Declare user(s)
  users = {
    users.delta = {
      name = "delta";
      home = "/Users/delta";
    };
  };

  # List packages installed in system profile. 
  environment = {
    systemPackages = with pkgs; [
      neovim
      git
      tree
      aerospace
      sketchybar
      fastfetch
      kitty
      starship
      zoxide
      eza
      gh
      nh
      btop
      tmux
      tailscale
    ];

    variables = {
      EDITOR = "neovim";
    };
  };

  # Lix (Like Nix)
  nix = {
    package = pkgs.lix;

    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";
  };

