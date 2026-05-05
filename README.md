```
    ______     ___                      
   / ____/____/ (_)___  ________  ____ _
  / __/ / ___/ / / __ \/ ___/ _ \/ __ `/
 / /___/ /__/ / / /_/ (__  )  __/ /_/ / 
/_____/\___/_/_/ .___/____/\___/\__,_/  
              /_/                       
```

# WIP - Very early stages!
- This is a NixOS flake currently being built from the ground up
- As of now, it is very bare bones, not really a lot going on (yet)

# Installation
- For now, just don't. This is in active development - the only things that don't suck right now are Hyprland and Neovim, neither of which are completed. 
- If you really want to check it out: 
    1. Fresh install of NixOS 
    2. Clone this repo
    3. Go through flake.nix, configuration.nix, and home.nix, and change the necessary aspects (user and machine names)
    4. Remove secrets.yaml, and modify .sops.yaml with your own stuff, or remove it entirely. 
    5. Rebuild and you're good to go 

# What's Included?
- Plymouth
- SDDM
- Hyprland
- Kitty
- Fish
    - Nushell (just for the `ls` output)
- Neovim
- Firefox
- Zathura
- Theming: Matugen, awww, quickshell, sweet-nova 
- CLIs: btop, tmatrix, figlet, gh, git, nh, wl-clipboard, imagemagick, tree, fzf, yazi, zoxide, fastfetch, tmux, jq, ripgrep, lazygit, fortune, sops, age, ssh-to-age

# Contributing
- For the love of Odin can someone please just tell me how to get the frame with rounded corners as seen in Caelestia shell?

# Inspirations
- Caelestia Shell & Dots
- HyDE Project
- Noctalia Shell 
