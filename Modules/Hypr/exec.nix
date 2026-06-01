# Hyprland Executions
# ==============================================================


# { ... }: 

{
  exec-once = [
    # Cursors 
    "hyprctl setcursor Sweet-cursors 24"
    "gsettings set org.gnome.desktop.interface cursor-theme 'Sweet-cursors'"
    "gsettings set org.gnome.desktop.interface cursor-size 24"

    # Startup
    "awww-daemon &"
    # "awww img --transition-type wave --transition-step 90 /home/delta/Pictures/Wallpapers/anime-petals-in-water.jpg"
    "awww restore"
    "qs"
  ];

}
