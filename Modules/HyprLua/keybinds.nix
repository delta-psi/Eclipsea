
# CURRENT: Make clean way to make submap keybindings using helper function in let ... in block 
#   - Resizing windows via keys
#   - Music: Pause/Play, Previous, Next
#   - Hyprland/Envionment Stuff 
#     - Hypr Modes, Hyprpicker, Quickshell, ...
#     - Window Manipulation: Fullscreen, maximized, floating 
# NEXT: Replace `uwsm -- ` with `app2unit -- `

{ lib, lua, vars, ... }:

let 
  mod = "SUPER";
  # terminal = "kitty";
  # browser = "firefox"; # Soon to be Zen browser 
  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    float = lua ''hl.dsp.window.float({ action = "toggle" })'';
    fullscreen = mode: lua ''hl.dsp.window.fullscreen({ mode = "${mode}" })'';
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    layout = msg: lua ''hl.dsp.layout("${msg}")'';
    swap = dir: lua ''hl.dsp.window.swap({ direction = "${dir}" })'';
    toggleSpecial = name: lua ''hl.dsp.workspace.toggle_special("${name}")'';
    moveToSpecial = name: lua ''hl.dsp.window.move({ workspace = "special:${name}" })'';
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
    drag = lua "hl.dsp.window.drag()";
    resize = { dir ? null }: 
      if dir == null 
      then lua "hl.dsp.window.resize()"
      else lua ''hl.dsp.window.resize("${dir}")'';
    submap = name: lua ''hl.dsp.submap("${name}")'';
  };
  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  bindOpts = keys: dispatcher: opts: {
    _args = [
      keys
      dispatcher
      opts
    ];
  };
  submap = name: binds: {
    _args = [
      name 
      (lua ''
        function()
          ${lib.concatStringsSep "\n " binds}
        end
      '')
    ];
  };
  submapBind = key: action: ''
    hl.bind("${key}", ${action})
  '';
  submapBindR = key: action: ''
    hl.bind("${key}", ${action}, { repeating = true })
  '';
  # submap = name: binds: {
  #   _args = [
  #     name
  #     lua binds
  #   ];
  # };
  workspaceBinds = lib.concatMap(i: 
    let key = toString(lib.mod i 10);
    in [
      (bind  "${mod} + ${key}" (dsp.focusWorkspace i))
      (bind  "${mod} + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);
in
{
  bind = [

    # Open Applications 
    (bind "${mod} + T" (dsp.exec "uwsm app -- ${vars.terminal}"))
    # (bind "${mod} + SHIFT + T" (dsp.exec "uwsm app -- ")) # mini-floating terminal window (for fastfetch & quick commands)
    (bind "${mod} + W" (dsp.exec "uwsm app -- ${vars.browser}"))
    (bind "${mod} + I" (dsp.toggleSpecial "idle"))
    (bind "${mod} + B" (dsp.toggleSpecial "systemStats"))
    (bind "${mod} + C" (dsp.toggleSpecial "clock"))


    # Tools 
    (bind "${mod} + ALT + H" (dsp.exec "uwsm app -- hyprpicker --autocopty --format=hex"))

    # Quickshell Commands
    (bind "${mod} + CONTROL + B" (dsp.exec "${vars.shellToggle}"))

    # Hypr Modes
    (bind "${mod} + Z" (dsp.exec "${vars.shellToggle} ; ~/.config/hypr/zen.sh"))
    (bind "${mod} + ALT + F" (dsp.exec "~/.config/hypr/frost.sh"))
    (bind "${mod} + ALT + S" (dsp.exec "${vars.shellCurveToggle} ; ~/.config/hypr/square.sh"))
    (bind "${mod} + ALT + O" (dsp.exec "~/.config/hypr/opaque.sh"))

    # Special Workspaces & Movements
    (bind "${mod} + S" (dsp.toggleSpecial "magic")) 
    (bind "${mod} + M" (dsp.toggleSpecial "music"))
    (bind "${mod} + D" (dsp.toggleSpecial "communication"))
    (bind "${mod} + SHIFT + S" (dsp.moveToSpecial "magic")) 
    (bind "${mod} + SHIFT + M" (dsp.moveToSpecial "music"))
    (bind "${mod} + SHIFT + D" (dsp.moveToSpecial "communication"))

    # Change Window Focus 
    (bind "${mod} + H" (dsp.focus "left"))
    (bind "${mod} + J" (dsp.focus "down"))
    (bind "${mod} + K" (dsp.focus "up"))
    (bind "${mod} + L" (dsp.focus "right"))

    # Swap Windows 
    (bind "${mod} + SHIFT + H" (dsp.swap "left"))
    (bind "${mod} + SHIFT + J" (dsp.swap "down"))
    (bind "${mod} + SHIFT + K" (dsp.swap "up"))
    (bind "${mod} + SHIFT + L" (dsp.swap "right"))

    # Window Actions (Float, Drag, Resize, Splits, Fullscreen)
    (bind "${mod} + Q" dsp.close)
    # (bind "${mod} + F" (dsp.fullscreen "fullscreen"))
    # (bind "${mod} + SHIFT + F" (dsp.fullscreen "maximized"))
    # (bind "${mod} + ALT + F" dsp.float)
    (bind "${mod} + V" (dsp.layout "togglesplit"))

    # Volume
    (bindOpts "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume @ 5%+") { locked = true; repeating = true; })
    (bindOpts "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @ 5%-") { locked = true; repeating = true; })
    (bindOpts "XF86AudioMute" (dsp.exec "wpctl set-mute @ toggle") { locked = true; })
    (bindOpts "XF86AudioMicMute" (dsp.exec "wpctl set-mute u/DEFAULT_AUDIO_SOURCE@ toggle") { locked = true; })

    # Mouse move/resize
    (bindOpts "${mod} + mouse:272" dsp.drag { mouse = true; })
    (bindOpts "${mod} + mouse:273" dsp.resize { mouse = true; })

    # Submap: Keys resize 
    (bind "${mod} + R" (dsp.submap "resize"))
    (bind "${mod} + P" (dsp.submap "music"))
    (bind "${mod} + F" (dsp.submap "window"))

  ] 
  ++ workspaceBinds;

  # Submaps
  define_submap = [
    {
      _args = [
        "resize"
        (submapBindR "L" "hl.dsp.window.resize({ x = 10, y = 0, relative = true })")
        (submapBindR "H" "hl.dsp.window.resize({ x = -10, y = 0, relative = true })")
        (submapBindR "K" "hl.dsp.window.resize({ x = 0, y = 10, relative = true })")
        (submapBindR "J" "hl.dsp.window.resize({ x = 0, y = -10, relative = true })")
        (submapBind "escape" ''hl.dsp.submap("reset")'')
      ];
    }
    {
      _args = [
        "music"
        (submapBind "L" ''hl.dsp.exec("playerctl next")'')
        (submapBind "H"  ''hl.dsp.exec("playerctl previous")'')
        (submapBind "space" ''hl.dsp.exec("playerctl play-pause")'')
        (submapBind "escape" ''hl.dsp.submap("reset")'')
      ];
    }
    {
      _args = [
        "window"
        (submapBind "F" (dsp.fullscreen "fullscreen"))
        (submapBind "M" (dsp.fullscreen "maximized"))
        (submapBind "T" dsp.float)
      ];
    }
  ];
  
}
