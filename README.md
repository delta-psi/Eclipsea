```
                    ______     ___                      
                   / ____/____/ (_)___  ________  ____ _
                  / __/ / ___/ / / __ \/ ___/ _ \/ __ `/
                 / /___/ /__/ / / /_/ (__  )  __/ /_/ / 
                /_____/\___/_/_/ .___/____/\___/\__,_/  
                              /_/                       
```

# Work in progress!
- This is a NixOS flake currently being built from the ground up
- As of now, it has mostly taken shape, but there's still plenty of consruction to do. 
- There is a quickshell to go along with this (Eclipsea-Shell), that does nothing beyond show workspaces. Eventually, that will get fleshed out as well, but that's on hold for a while. If you want a Caelestia inspired shell that does basically nothing, that is the shell for you! 

# Installation
- It's not a super well done config, but it gets the job done. Currently, there are two machine configs in this flake, for a laptop and a desktop. 
    - The desktop does not include Eclipsea-Shell in it's config as of now, so it is free to be extended with your shell or bar of choice. 
    - The laptop configuration is currently using Noctalia shell. 
- If you really want to check it out: 
    1. Fresh install of NixOS 
    2. Clone this repo
    3. Go through flake.nix, configuration.nix, and home.nix, and change the necessary aspects (user and machine names)
        - Eventually, these will be separated into a more convenient place to change all of them in one place. 
    4. Remove secrets.yaml, and modify .sops.yaml with your own stuff, or remove it entirely. 
        - These are encrypted files that will do nothing for you. 
    5. Rebuild and you're good to go 
        - NOTE: This is using the CachyOS kernel (cachyos-bore-lto), and Hyprland flake, so expect the first build to take a while, as these are being compiled from source. The substituters and public keys are in the configuration, but get ignored for a reason that I have been too lazy to investigate. 

# What's Included?
- Plymouth
- SDDM
- Hyprland
- Kitty
- Fish
    - Nushell (just for the `ls` output $\because$ it looks clean)
- Neovim
- Firefox
- Zathura
- Theming: Matugen, awww, sweet icons & cursors 
    - Beware: theming has barely been handled
- CLIs: btop, tmatrix, figlet, gh, git, nh, wl-clipboard, imagemagick, tree, fzf, yazi, zoxide, fastfetch, tmux, jq, ripgrep, lazygit, fortune, sops, age, ssh-to-age, and plenty more. 

# Important Keybindings
- Super + T -> Open Kitty 
- Super + Q -> Close active window 
- Super + W -> Open Zen (Twilight) browser
- Super + Shift + T -> Floating mini terminal (for the fastfetch flex)
- Super + Control + B -> Toggle shell visiblity (for both Eclipsea-Shell & Noctalia)
- For laptop only ($\because$ Noctalia):
    - Super + Control + W -> Wallpaper selector
- And plenty more that I am too lazy to list here right now. Check out /Modules/HyprLua/keybinds.nix for the complete list. 

# Hypr Modes - The Special Sauce
- Super + F -> Fullscreen 
- Super + Shift + F -> Pseudo fullscreen 
- Super + Control + F -> Toggle floating window 
- Super + Alt + F -> "Frosted Glass" Mode: More blur in windows
- Super + Alt + G -> "Glass" Mode: Completely transparent
- Super + Z -> "Zen Mode": Fullscreen with tiling (multiple windows)
- Super + Alt + S -> "Square Mode": Square corners instead of rounding
- Super + Alt + O -> "Opaque Mode": Fully opaque windows 
- **Note**: These Hypr modes (other than normal fullscreen) are composable, so you may combine these. For example, you can change your windows to just Zen mode, or Zen & Frosted, Square & Opaque, Pseudo fullscreen & Square & Opaque, etc. These are dynamic, togglable modes that don't override each other. These modes were created so window styling could be changed without having to rebuild. Frosted mode is nice for reading, zen is nice for maximizing screen usage and diminishing distractions, opaque is good for videos without going fullscreen, etc. 

# Kitty Terminal 
- Control + Shift + O -> "Opaque" background color (this with Hypr Glass mode is probably my favorite)
- Control + Shift + T -> Transparent background (thid with Hypr Glass mode is just text over your background)
- The rest of the kitty keybinds are left as defaults

# Neovim 
It's mostly snacks. I'll flesh this section out more in the future, but for now you can have these:
- \ + E -> File tree 
- \ + Space -> Telescope
- \ + V or H -> Toggle vertical or horizontal split 
- Control + \ -> Toggle terminal 
- Shift + H or L -> Switch buffer left or right 

# Special Workspaces 
- Super + S -> Empty special workdspace
- Super + M -> Spicetify
- Super + D -> Vesktop (for some reason doesn't like to open in the workdspace, which is annoying. It'll get fixed, eventually)
- Super + B -> Btop 
- Super + C -> Clock (era - terminal clock with rain)
- Super + I -> Idle (terminal rain lightning)
- Super + Y -> tYping (yes that capitalization is on purpose. This opens up tukai)

# Fish Shell Aliases 
- `reload` -> `cd ~ && clear && fastfetch && echo`
- `ec` -> `cd ~/Configs/Eclipsea && tree -d`
- `rebuild` -> `nh os switch . -H ${machine}`
- `build` -> `nh os boot . -H ${machine}`
- `clean` -> `nh clean all --keep 5 --keep-since 7d --optimise`
- `gf` -> `git fetch`
- `gs` -> `git status`
- `gc` -> `git_commit`
    - git_commit -> `git add . && git commit -m $input`
        - `gc` will prompt you for your commit message
- `gp` -> `git push`

# Contributing
- For the love of Odin can someone please just tell me how to get the frame with rounded corners as seen in Caelestia shell?
    - Nevermind, figured it out. 


# Inspirations
- Caelestia Shell & Dots
- HyDE Project
- Noctalia Shell 
