
{ pkgs, ... }:

with pkgs; [
  
  # Apps
  kitty
  neovim

  # CLIs 
  # xdotool
  tree
  tmux 
  btop
  nh
  gh
  fzf
  git
  zoxide
  yazi
  fastfetch
  jq
  ripgrep
  lazygit
  sops
  ssh-to-age
  mermaid-cli
  ffmpeg
  unzip
  # vlc 
  sshfs
  rsync
  eza 
  pay-respects
  # meowpdf

  # Languages
  texliveFull
  python314

  # Misc 
  tailscale

  # Fun stuff
  pokemon-colorscripts
  fortune
  figlet
  tmatrix
  era
  asciiquarium
  tukai
  sl 
  cowsay
  lolcat
  terminal-rain-lightning

]

# NixOS only 
# imagemagick 
# awww
# nushell
# wl-clipboard
# overskride
# smassh
# cava
# vesktop
# vial
# wev
# hyprpicker
# playerctl
# thunar
# thunar-volman
# thunar-archive-plugin
# remmina
# freerdp
# sweet-nova
# sweet
# sweet-folders
# elegant-sddm
# nwg-look
# terminal-rain-lightning
#
# inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
# inputs.matugen.packages.${stdenv.hostPlatform.system}.default
# wallust
# quickshell
# qt6.qtdeclarative
# kdePackages.qt5compat
# qt5.qtdeclarative
# kdePackages.qtmultimedia
# kdePackages.qtsvg
# kdePackages.qtvirtualkeyboard
# qt5.qtgraphicaleffects
# kdePackages.qt6ct
#
#
# xdg-desktop-portal
# xdg-desktop-portal-wlr

# Mac server only
# emacs
# bfs
# aerospace
# sketchybar
