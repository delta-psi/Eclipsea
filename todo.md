# Eclipsea (Dendritic Nix Configuration)

- System optimization
    - nh instead of nixos-rebuild
    - set up auto garbage collect
    - set up store cleaning and optimization
- Finish Hyprland configuration
    - Break up into submodules
- Matugen integration
    - fastfetch
    - fzf
    - yazi
    - cava
    - btop
    - neovim
- Create new (Quick)Shell
    - Based on Caelestia with some Noctalia influence
- Configure apps
    - VS Codium (LaTeX)
    - Zen Browser
    - Positron 
- Find FOSS alternatives
    - Obsidian (Logseq)
    - Notion (Appflowy)
    - Spotify (Amberol; spotify-dl to download spotify library)
    - Discord (XMPP)

1. Read/Learn
    - Nix Language/Manual
    - NixOS vs Home-Manager
    - Nixpkgs module system
    - The `deferredModule` type
    - Derivations
    - Flake-parts
    - Dendritic Pattern

2. Restructure flake
    - Dendritic Pattern: flake-parts, ...
    - Modular & submodular
    - Make module & submodule components optional
    - Keep major components on nixpkgs-stable for stability
        - Hyprland, Quickshell/Noctalia-qs
3. Configure flake for all machines
    - single user
    - system, security, services, options, etc.
    - CachyOS-Zen kernel, zram, quiet boot, ...
4. Sops-Nix/Security/Encryption stuff
    - Networking
        - ssh, tailscale/headscale, caddy, sunshine/moonlight, 
    - Make git repo
5. Clean up wallpapers repo
    - Add to flake as module? 
    - Make the repo a flake that I can import to my flake config??
6. Hyprland
    - Normal, Special, & Zen workspaces
    - Caelestia inspired dotfiles
        - More animated, more 'dark frosted glass' look
7. Theming
    - Matugen, GTK, ...
    - Sweet Rainbow icons/folders/cursors
    - Nerd font
8. Quickshell
    - Caelestia with some add ons from Noctalia and such
9. Terminal
    - CLIs
    - Editors
    - Programming
        - Python, R, LaTeX, C, C++, Rust, Julia, Nim, Crystal, Zig, Lua, Haskell
10. Productivity
11. Browsers
12. Misc. 
13. Gaming
14. Server & Remote operations/deployments with Nomad
    - Forgejo, Minecraft
15. Make positron nixpkgs or flake for configuration

