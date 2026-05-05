
{ configs, pkgs, lib, ... }:

{

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Disbale greeting
      set fish_greeting

      # Auto start Hyprland
      if status is-login
        if test -z "$DISPLAY" -a "XDG_VTNR" = 1
          exec hyprland
        end
      end

      if not set -q NVIM
        fastfetch && echo
      end

      function git_commit
        read --prompt "echo 'Commit Message: '" input
        git add . && git commit -m $input
      end 

      # Integrade zoxide
      zoxide init fish | source
    '';
    shellAliases = {
      # ls = "eza --icons=always";
      ls = "nu -c ls";
      # fastfetch = "fastfetch --kitty (printf '%s\n' ../../Assets/Logos/*.png | shuf -n 1)";
      # fastfetch = "bash ~/.config/fastfetch/random-logo.sh";
      reload = "cd ~ && clear && fastfetch && echo";
      ec = "cd ~/Configs/Eclipsea && tree -d";
      rebuild = "sudo nixos-rebuild switch --flake .#nu";
      build = "sudo nixos-rebuild build --flake .#nu";
      clean = "nh clean all --keep 5 --keep-since 7d --optimise";

      # Git
      gs = "git status";
      gc = "git_commit";
      gp = "git push";
    };

  };

}
