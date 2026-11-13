
{ pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      use_nerd_font_icons = true;
      ui = {
        theme = "matugen";
      };
    };
    channels = {

      tldr = {
        metadata = {
          name = "tldr";
          description = "Browse & preivew TLDR help pages";
          requirements = [ "tldr" ];
        };
        preview = {
          command = "tldr '{}' --color always";
        };
        source = {
          command = "tldr --list";
        };
        keybindings = {
          "ctrl-e" = "actions:open";
        };
        # ui = {
        #   layout = "portrait";
        # };
        actions.open = {
          description = "Open TLDR page in pager";
          # command = "tldr '{}' | less";
          command = "tldr '{0}'";
          mode = "execute";
          # mode = "fork";
        };
      };

      recent-files = {
        metadata = {
          name = "recent-files";
          description = "Recently modified files";
          requirements = [ "fd" ];
        };
        source = {
          command = "fd -t f --changed-within 7d";
        };
        preview = {
          command = "bat -n --color=always '{}'";
        };
      };

      fish-history = {
        metadata = {
          name = "fish-history";
          description = "View fish history";
          requirements = [ "fish" ];
        };
        source = {
          command = "fish -c 'history'";
          no_sort = true;
          frecency = false;
        };
      };

      fonts = {
        metadata = {
          name = "fonts";
          description = "List installed system fonts";
          requirements = [ "fc-list" ];
        };
        source = {
          command = "fc-list --format='%{family}\n' | sort -uf";
        };
        preview = {
          command = "fc-list '{}' --format='%{file}\n%{style}\n%{family}\n' | head -20";
        };
        ui.preview_panel = {
          size = 70;
        };
      };

      git-remotes = {
        metadata = {
          name = "git-remotes";
          description = "List and manage git remotes";
          requirements = [ "git" ];
        };
        source = {
          command = "git remote";
        };
        preview = {
          command = "git remote show '{}'";
        };
        actions.fetch = {
          description = "Fetch from the selected remote";
          command = "git fetch {}";
          mode = "execute";
        };
        actions.remove = {
          description = "Remove the selected remote";
          command = "git remote remove {}";
          mode = "execute";
        };
      };

      git-submodules = {
        metadata = {
          name = "git-submodules";
          description = "List and manage git submodules";
          requirements = [ "git" ];
        };

        source = {
          command = "git submodule status | awk '{print $2}'";
        };

        preview = {
          command = "git -C '{}' log --oneline -10 --color=always";
        };

        actions.update = {
          description = "Update the selected submodule";
          command = "git submodule update --init --recursive {}";
          mode = "execute";
        };

        actions.sync = {
          description = "Sync the selected submodule URL";
          command = "git submodule sync {}";
          mode = "execute";
        };
      };

      ssh-hosts = {
        metadata = {
          name = "ssh-hosts";
          description = "SSH Hosts";
          requirements = [ "grep" "tr" "cut" "awk" ];
        };
        source = {
          command = "grep -E '^Host(name)? ' $HOME/.ssh/config | tr -s ' ' | cut -d' ' -f2- | tr ' ' '\n' | grep -v '^$'";
        };
        preview = {
          command = "awk '/^Host / { found=0 } /^Host (.*[[:space:]])?'{}'([[:space:]].*)?$/ { found=1 } found' $HOME/.ssh/config";
        };
        keybindings = {
          enter = "actions:connect";
        };
        actions.connect = {
          description = "SSH into the selected host";
          command = "ssh {}";
          mode = "execute";
        };
      };

      trash = {
        metadata = {
          name = "trash";
          description = "Browse and restore trashed files";
          requirements = [ "trash-list" "trash-restore" ];
        };
        source = {
          command = "trash-list 2>/dev/null";
          no_sort = true;
          frecency = false;
        };
        preview = {
          command = "echo '{}'";
        };
        ui = {
          layout = "portrait";
        };
        ui.preview_panel = {
          size = 30;
        };
        actions.restore = {
          description = "Restore the selected trashed file";
          command = "echo '{split: :1..}' | trash-restore";
          mode = "execute";
        };
        actions.empty = {
          description = "Empty the entire trash";
          command = "trash-empty";
          mode = "execute";
        };
      };

      unicode = {
        metadata = {
          name = "unicode";
          description = "Search and select unicode characters";
          requirements = [ "awk" "perl" "wl-copy" ];
        };
        source = {
          # command = "set UNICODE_FILE \"/usr/share/unicode/ucd/UnicodeData.txt\"\nawk -F';' '\n  $2 !~ /^</ { print $1 \"|\" $2 }\n' \"$UNICODE_FILE\" | perl -CS -F'\\|' -lane '\n    $code = $F[0];\n    $desc = $F[1];\n    $char = chr(hex($code));\n    print \"U+$code|$char|$desc\" if $char =~ /\\p{Print}/;\n'\n";
          # command = "awk -F';' '$2 !~ /^</ {print $1, $2}' ${pkgs.unicode-character-database}/share/unicode/UnicodeData.txt";
          command = ''
            awk -F';' '
              $2 !~ /^</ { print $1 "|" $2 }
              ' ${pkgs.unicode-character-database}/share/unicode/UnicodeData.txt | perl -CS -F'\|' -lane '
              $code = $F[0];
              $desc = $F[1];
              $char = chr(hex($code));
              print "U+$code|$char|$desc" if $char =~ /\p{Print}/;
            '
          '';
          display = "{split:|:0}    {split:|:1}    {split:|:2}";
          output = "{split:|:1}";
        };
        actions.copy = {
          description = "Copy the selected character to the clipboard";
          command = "printf '%s' '{split:|:1}' | ${pkgs.wl-clipboard}/bin/wl-copy";
          mode = "execute";
        };
        keybindings = {
          enter = "actions:copy";
        };
      };

      zoxide = {
        metadata = {
          name = "zoxide";
          description = "Browse zoxide directory history";
          requirements = [ "zoxide" ];
        };
        source = {
          command = "zoxide query -l";
          no_sort = true;
          frecency = false;
        };
        preview = {
          command = "ls -la --color=always '{}'";
        };
        keybindings = {
          enter = "actions:cd";
          ctrl-d = "actions:remove";
        };
        actions.cd = {
          description = "Change to the selected directory";
          command = "cd {} && $SHELL";
          mode = "execute";
        };
        actions.remove = {
          description = "Remove the selected directory from zoxide";
          command = "zoxide remove {}";
          mode = "fork";
        };
      };
    };
  };
}
