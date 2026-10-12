
{ pkgs, config, ... }:

let
	yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "main";
		hash = "sha256-DfcN2VU+8iQazgT9MXm2dj7742W5fhScSm1FEkd/5Tk=";
	};
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    theme = {
      manager = {
        # Rounded ends for the hovered/selected line
        sep_left = { 
          open = ""; 
          close = ""; 
        };
        sep_right = { 
          open = ""; 
          close = ""; 
        };
      };
    };
    settings = {
      mgr = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
      indicator = {
        padding = {
          open = "";
          closing = "";
        };
      };
      status = {
        sep_left = { 
          open = "";
          close = "";
        };
        sep_right = { 
          open = "";
          close = "";
        };
      };
      plugin = {
        prepend_previewers = [
          { 
            url = "*/"; 
            run = "piper -- eza --tree --color=always --icons=always --level=2 \"$1\""; 
          }
          { 
            url = "*.md"; 
            run = "piper -- glow -s dark -w \"$w\" \"$1\""; 
          }
          { 
            mime = "text/*"; 
            run = "piper -- bat --color=always --paging=never --style=plain,numbers \"$1\""; 
          }
          { 
            mime = "application/json"; 
            run = "piper -- bat --color=always --paging=never --style=plain,numbers \"$1\""; 
          }
        ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = ["w"];
          desc = "Set as wallpaper";
          run = ''shell -- fish -ic 'wall $argv' "$(basename %h)"'';
        }
        {
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				}
				{
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
        {
          on = [ "g" "m" ];
          run = "cd /run/media/${config.home.username}";
          desc = "Go to media mounts";
        }
        # 2. Open the mount.yazi interactive menu to view, jump to, or eject drives
        {
          on = [ "M" ]; 
          run = "plugin mount";
          desc = "Open mount manager (eject / jump)";
        }
        {
          on = ["c"];
          run = "plugin copy-file-contents -- plain";
          desc = "Copy contents of file(s)";
        }
      ];
    };

    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
			toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      piper = "${yazi-plugins}/piper.yazi";
      mount = "${yazi-plugins}/mount.yazi";
      copy-file-contents = "${yazi-plugins}/copy-file-contents.yazi";


			# starship = pkgs.fetchFromGitHub {
			# 	owner = "Rolv-Apneseth";
			# 	repo = "starship.yazi";
			# 	rev = "main";
			# 	sha256 = "sha256-Jvoc/7YaOOppu8K2lJaVgiuBIyanRHHjEA6ZvnrFtiQ=";
			# };
      # faster-piper 
      # 
    };

    initLua = ''
			require("full-border"):setup {
        type = ui.Border.ROUNDED,
      }
		'';
  };
}
