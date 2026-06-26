
{ pkgs, ... }: 

{

  home.packages = [
    (pkgs.writeShellScriptBin "wall" ''
      # Configuration
      WALL_DIR="$HOME/Pictures/Wallpapers" 
      HYPR_MODES="$HOME/.config/hypr/modes.sh"
      
      # Check for argument
      if [ -z "$1" ]; then
        echo "Usage: wall <filename.png>"
        exit 1
      fi 

      FULL_PATH="$WALL_DIR/$1"

      # Check if the file exists
      if [ ! -f "$FULL_PATH" ]; then 
        echo "Error: Wallpaper '$1' not found in $WALL_DIR"
        exit 1
      fi 

      # Function to run commands silently unless they fail 
      stfu() {
        # Capture both stdout & stderr
        output=$("$@" 2>&1)
        status=$?

        # If command failed (exit != 0) print the output
        if [ $status -ne 0 ]; then 
          echo "Error running: $@"
          echo "$output"
          return $status
        fi 
      }

      # 1. Set wallpaper via awww
      stfu awww img --transition-type wave --transition-step 90 "$FULL_PATH"

      # 2. Run matugen
      # stfu matugen -q -t scheme-vibrant --prefer darkness image "$FULL_PATH"
      stfu matugen -q -t scheme-vibrant --prefer saturation --base16-backend wal --source-color-index 0 image "$FULL_PATH"
      # stfu wallust run -p saliencedark16 -I background "$FULL_PATH"

      # 3. Re-apply hyprland modes 
      if [ -f "$HYPR_MODES" ]; then 
        stfu "$HYPR_MODES"
      fi 

      echo "Wallpaper & theme updated successfully!"
    '')
  ];


}
