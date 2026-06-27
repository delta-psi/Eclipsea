
# CURRENT: Make clean way to make submap keybindings using helper function in let ... in block 
#   - Music: Pause/Play, Previous, Next
#   - Hypr Modes 
#   - Add Notifications for Hyprland Submap Activation
# NEXT: Replace `uwsm -- ` with `app -- `

{ lib, lua, vars, ... }:

let 
  mod = "SUPER";
  modes = import ./hypr-modes.nix { inherit lua vars; };
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
    resize = lua "hl.dsp.window.resize()";
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

  floater = lua ''
    function()
      local win = hl.get_active_window()
      hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
      if win.floating then 
        hl.dispatch(hl.dsp.window.resize({ x = 1200, y = 800, relative = false, window = "activewindow" }))
        hl.dispatch(hl.dsp.window.center())
      end 
    end
  '';
 
  workspaceBinds = lib.concatMap(i: 
    let key = toString(lib.mod i 10);
    in [
      (bind "${mod} + ${key}" (dsp.focusWorkspace i))
      (bind "${mod} + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);

in 
{
  bind = [

    # Open Applications 
    (bind "${mod} + T" (dsp.exec "uwsm app -- ${vars.terminal}"))
    (bind "${mod} + SHIFT + T" (dsp.exec "uwsm app -- ${vars.miniterm}"))
    # (bind "${mod} + ALT + T" (dsp.exec "uwsm app -- kitty -o background_opacity=0"))
    (bind "${mod} + W" (dsp.exec "uwsm app -- ${vars.browser}"))
    
    # Tools 
    (bind "${mod} + ALT + H" (dsp.exec "uwsm app -- hyprpicker --autocopy --format=hex"))

    # Quickshell Commands
    (bind "${mod} + CONTROL + B" (dsp.exec "${vars.shellToggle}"))

    # Hypr Modes
    (bind "${mod} + Z" modes.zenMode)
    (bind "${mod} + ALT + F" modes.frostMode)
    (bind "${mod} + ALT + S" modes.squareMode)
    (bind "${mod} + ALT + O" modes.opaqueMode)
    (bind "${mod} + ALT + G" modes.glassMode)

    # Special Workspaces & Movements
    (bind "${mod} + S" (dsp.toggleSpecial "magic")) 
    (bind "${mod} + M" (dsp.toggleSpecial "music"))
    (bind "${mod} + D" (dsp.toggleSpecial "comms"))
    (bind "${mod} + I" (dsp.toggleSpecial "idle"))
    (bind "${mod} + B" (dsp.toggleSpecial "systemStats"))
    (bind "${mod} + C" (dsp.toggleSpecial "clock"))
    (bind "${mod} + Y" (dsp.toggleSpecial "typing"))


    (bind "${mod} + SHIFT + S" (dsp.moveToSpecial "magic")) 
    (bind "${mod} + SHIFT + M" (dsp.moveToSpecial "music"))
    (bind "${mod} + SHIFT + D" (dsp.moveToSpecial "comms"))

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
    (bind "${mod} + Q" (dsp.close))
    (bind "${mod} + F" (dsp.fullscreen "fullscreen"))
    (bind "${mod} + SHIFT + F" (dsp.fullscreen "maximized"))
    # (bind "${mod} + CONTROL + F" (dsp.float))
    (bind "${mod} + CONTROL + F" floater)
    (bind "${mod} + V" (dsp.layout "togglesplit"))

    # Volume
    (bindOpts "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+") { locked = true; repeating = true; })
    (bindOpts "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") { locked = true; repeating = true; })
    (bindOpts "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") { locked = true; })
    (bindOpts "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCl@ toggle") { locked = true; })

    # Mouse move/resize
    (bindOpts "${mod} + mouse:272" (dsp.drag) {mouse = true; })
    (bindOpts "${mod} + mouse:273" (dsp.resize) {mouse = true; })

    # Submaps
    (bind "${mod} + R" (dsp.submap "resize"))
    (bind "${mod} + P" (dsp.submap "music"))
    # (bind "${mod} + F" (dsp.submap "window"))
    # (bind "${mod} + ALT + M" (dsp.submap "hypr-mode"))


  ] 
  ++ workspaceBinds;

  # Submaps
  #   - Submaps to make: 
  #     - Music, Window Management, Hypr-Modes, Special Workspaces(?)
  define_submap = [
    {
      _args = [
        "resize"
        (lua ''function()
          hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
          hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
          hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
          hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
          hl.bind("escape", hl.dsp.submap("reset"))
        end'')
      ];
    }
    {
      _args = [
        "music"
        (lua ''function()
          hl.bind("L", hl.dsp.exec_cmd("playerctl next"))
          hl.bind("H", hl.dsp.exec_cmd("playerctl previous"))
          hl.bind("space", hl.dsp.exec_cmd("playerctl play-pause"))
          hl.bind("escape", hl.dsp.submap("reset"))
        end'')
      ];
    }

  #   {
  #     _args = [
  #       "music"
  #       (submapBind "L" (lua ''hl.dsp.exec("playerctl next")''))
  #       (submapBind "H"  (lua ''hl.dsp.exec("playerctl previous")''))
  #       (submapBind "space" (lua ''hl.dsp.exec("playerctl play-pause")''))
  #       (submapBind "escape" (lua ''hl.dsp.submap("reset")''))
  #     ];
  #   }
  #   {
  #     _args = [
  #       "window"
  #       (lua ''function()
  #         (${submapBind} "F" (dsp.fullscreen "fullscreen"))
  #         (${submapBind} "M" (dsp.fullscreen "maximized"))
  #         (${submapBind} "T" dsp.float)
  #         end
  #       '')
  #     ];
  #   }
  #   {
  #     _args = [
  #       "hypr-modes"
  #         (${submapBind} "Z" (lua "toggle_zen"))
  #         (${submapBind} "S" (lua "toggle_square"))
  #         (${submapBind} "F" (lua "toggle_frost"))
  #         (${submapBind} "O" (${lua "toggle_opaque"}))
  #     ];
  #   }
  ];
  
}
