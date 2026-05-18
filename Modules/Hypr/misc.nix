# Hyprland Misc
# ==============================================================


{ ... }: 

{
  cursor = {
    no_hardware_cursors = 1;
  };

  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    disable_scale_notification = false;
    # "col.splash" = ;
    # font_family = ;
    # splash_font_family = ;
    force_default_wallpaper = 0;
    vfr = true;
    vrr = 1;
    # mouse_move_enables_dpms = ;
    # key_press_enables_dpms = ;
    # name_vk_after_proc = ;
    # always_follow_on_dnd = ;
    # layers_hog_keyboard_focus = ;
    animate_manual_resizes = true;
    animate_mouse_windowdragging = true;
    disable_autoreload = false;
    # enable_swallow = ;
    # swallow_regex = ;
    # swallow_exception_regex = ;
    # focus_on_active = ;
    mouse_move_focuses_monitor = true;
    allow_session_lock_restore = true;
    # session_lock_xray = ;
    # background_color = ;
    close_special_on_empty = true;
    # on_focus_under_fullscreen = ;
    # exit_window_retains_fullscreen = ;
    # initial_workspace_tracking = ;
    # middle_click_paste = ;
    render_unfocused_fps = 15;
    disable_xdg_env_checks = false;
    # lockdead_screen_delay = ;
    # enable_anr_dialog = ;
    # anr_missed_pings = ;
    # size_limits_tiled = ;
    # disable_watchdog_warning = ;
  };
}
