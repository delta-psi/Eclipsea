# To Do 
- [X] Migrate Hyprland to Lua config 
    - [ ] Finish Hyprland Config 
- [ ] Configure Apps:
    - [ ] Spicetify
    - [ ] Vesktop 
    - [ ] Zen Browser
- [ ] Finish Neovim Config 
    - [ ] Snacks ecosystem, LaTeX and Data Science workflows
- [ ] Terminal Config
    - [ ] Kitty
    - [ ] Starship
    - [ ] Fish + Nushell 
    - [ ] CLIs 
- [ ] Theming with Wallust 
    - [ ] Port colors -> 
        - [ ] Hyprland 
        - [ ] Quickshell 
        - [ ] Kitty 
        - [ ] Starship 
        - [ ] Neovim 
        - [ ] Zen Browser 
        - [ ] Vesktop 
        - [ ] Spicetify
- [ ] Make ISO to install full config on Laptop
    - [ ] Push all repo changes and such 
    - [ ] Make machine config for laptop 

- [ ] Finish Hyprland Configuration 
    - [ ] Have quickshell inherit opacity and colors from hyprland/wallust
- [ ] Fix matugen colors (scrap and replace with whatever Caelestia & Noctalia shells do?)
    - [ ] Replace with wallust - configure this, export colors to everything
- [ ] Finish Neovim Configuration 
    - [ ] Complete config for Markdown/Notes/Obsidian replacement
        - [ ] Make snacks.indent not render in Markdown files
    - [ ] Complete config for $\LaTeX$ writing 
        - [ ] PDF Viewer pane if possibe, Zathura if not 
        - [ ] Figure out BibLaTeX as well
    - [ ] Complete config for Data Science
        - [ ] Programming in R
            - [ ] Line by line execution?
        - [ ] Jupyter Notebooks
        - [ ] Variables pane
        - [ ] Plotting/Graphs pane
    - [ ] Complete config for Python programming 
- [ ] Make Quickshell configuration declarative/part of Nix flake 
- [ ] Make Bash/Python script in Nix to pull # TODO sections from beginning of all Nix files to generate this todo list 
- [ ] Replace all Bash scripts with Lua (or Python)
- [ ] Make Nix module to export keybinds from all apps/programs to a single file 
    - [ ] Make Quickshell togglable window to display all keybinds
        - [ ] Formatted by App/Program, then Headings (and subheadings?)

# Questions
- [ ] For Quickshell, should I just fork Caelestia and modify it? 
    - [ ] Keybinds window 
    - [ ] Better icons (sweet is the only answer)
    - [ ] No defaulting schemes/vibrancy when switching wallpapers
    - [ ] Better workspace icons 

# Eclipsea (Dendritic Nix Configuration)

- [ ] System optimization
    - [ ] nh instead of nixos-rebuild
    - [ ] set up auto garbage collect
    - [ ] set up store cleaning and optimization
- [ ] Finish Hyprland configuration
    - [ ] Break up into submodules
- [ ] Matugen integration
    - [ ] fastfetch
    - [ ] fzf
    - [ ] yazi
    - [ ] cava
    - [ ] btop
    - [ ] neovim
- [ ] Create new (Quick)Shell
    - [ ] Based on Caelestia with some Noctalia influence
- [ ] Configure apps
    - [ ] VS Codium (LaTeX)
    - [ ] Zen Browser
    - [ ] Positron 
- [ ] Find FOSS alternatives
    - [ ] Obsidian (Logseq)
    - [ ] Notion (Appflowy)
    - [ ] Spotify (Amberol; spotify-dl to download spotify library)
    - [ ] Discord (XMPP)

1. Read/Learn
    - [ ] Nix Language/Manual
    - [ ] NixOS vs Home-Manager
    - [ ] Nixpkgs module system
    - [ ] The `deferredModule` type
    - [ ] Derivations
    - [ ] Flake-parts
    - [ ] Dendritic Pattern

2. Restructure flake
    - [ ] Dendritic Pattern: flake-parts, ...
    - [ ] Modular & submodular
    - [ ] Make module & submodule components optional
    - [ ] Keep major components on nixpkgs-stable for stability
        - [ ] Hyprland, Quickshell/Noctalia-qs
3. Configure flake for all machines
    - [ ] single user
    - [ ] system, security, services, options, etc.
    - [ ] CachyOS-Zen kernel, zram, quiet boot, ...
4. Sops-Nix/Security/Encryption stuff
    - [ ] Networking
        - [ ] ssh, tailscale/headscale, caddy, sunshine/moonlight, 
    - [ ] Make git repo
5. Clean up wallpapers repo
    - [ ] Add to flake as module? 
    - [ ] Make the repo a flake that I can import to my flake config??
6. Hyprland
    - [ ] Normal, Special, & Zen workspaces
    - [ ] Caelestia inspired dotfiles
        - [ ] More animated, more 'dark frosted glass' look
7. Theming
    - [ ] Matugen, GTK, ...
    - [ ] Sweet Rainbow icons/folders/cursors
    - [ ] Nerd font
8. Quickshell
    - [ ] Caelestia with some add ons from Noctalia and such
9. Terminal
    - [ ] CLIs
    - [ ] Editors
    - [ ] Programming
        - [ ] Python, R, LaTeX, C, C++, Rust, Julia, Nim, Crystal, Zig, Lua, Haskell
10. Productivity
11. Browsers
12. Misc. 
13. Gaming
14. Server & Remote operations/deployments with Nomad
    - [ ] Forgejo, Minecraft
15. Make positron nixpkgs or flake for configuration

## Machines 

- [ ] Reorganize desk setups 

### Main Setup 

- [ ] Take off books & shelves 
- [ ] Make this shit cleannnnn 
- [ ] Make lamps symmetrical
- [ ] Add Lightbar over monitor 
- [ ] Add drawers for stuff 
- [ ] Rebuild PC in Fractal Terra Case 
- [ ] Split keyboard 

### Gaming Setup 

- [ ] Add monitor shelf 
- [ ] Reorient monitors (stacked)
- [ ] 

$$
\int_0^\infty e^{-x^2}\,dx = \frac{\sqrt{\pi}}{2}
$$

I love $\LaTeX$ and $\Delta$ is one of my favorite greek letters, and $x^{2} = x$ is an underrated property. 

Hi, $x^3$ and $a_{0}$ are awesome too. 

Hello, I am $\Delta$ 

I am making $x^5$ the new prime suspect of studying polynomials. 

Here is an example of a sequence that I have no idea how to handle, but I am pretty sure it converges to $0$: 
$$
\sum^{\infty}_{n = 1} \dfrac{1}{n^{2}}
$$
And here is a sequence: 
$$\langle a_0, a_1, \ldots, a_n \rangle$$








Bing bing, this be some bullsheet lolz. But, here's a $\Psi$ for your troubles. 




