# Neovim Highlights

{
  highlight = {

    # DiffAdd = {
    #   fg = "#a6e3a1";
    #   bg = null;
    # };

    # Core variable groups
    "@variable"                 = { fg = "#ff7eb6"; }; # or your chosen color
    "@variable.member"          = { fg = "#bbbbbb"; }; #ff29ff, #cdcdcd, #adebb3, #99fb98
    "Identifier"                = { fg = "#ff7eb6"; }; #ff7eb6
    "@string"                   = { fg = "#be95ff"; italic = true; };
    "@number"                   = { fg = "#83cfff"; };

    # Keywords (if they're also showing #d0d0d0) #cdcdd0, #bbb6b4
    # "@keyword"                    = { fg = "#ff7eb6"; };
    # "@keyword.function"           = { fg = "#ff7eb6"; };
    # "@keyword.return"             = { fg = "#ff7eb6"; };
    # "@keyword.operator"           = { fg = "#ff7eb6"; }; #be95ff

    # Nix-specific (since you're in a Nix config)
    # "@variable.nix"               = { fg = "#78a9ff"; };
    "@string.special.path.nix"  = { fg = "#be95ff"; };

    # Punctuation
    "@punctuation.bracket"      = { fg = "#3ddbd9"; };
    "@punctuation.delimiter"    = { fg = "#3ddbd9"; };

    # Operators
    "@operator"                 = { fg = "#78a9ff"; }; #86aeda

    # Core windows
    # "Normal"                    = { bg = "NONE"; };
    "NormalNC"                  = { bg = "NONE"; };
    "NormalFloat"               = { bg = "NONE"; };
    "FloatBorder"               = { bg = "NONE"; };
    "FloatTitle"                = { bg = "NONE"; };

    # Snacks explorer
    "SnacksExplorerNormal"      = { bg = "NONE"; };
    "SnacksExplorerNormalNC"    = { bg = "NONE"; };
    "SnacksExplorerWinBar"      = { bg = "NONE"; };

    # Toggleterm
    "ToggleTerm"                = { bg = "NONE"; };
    "ToggleTermNormal"          = { bg = "NONE"; };
    "Terminal"                  = { bg = "NONE"; };

    # Status/tab lines
    "StatusLine"                = { bg = "NONE"; };
    "StatusLineNC"              = { bg = "NONE"; };
    "TabLine"                   = { bg = "NONE"; };
    "TabLineFill"               = { bg = "NONE"; };
    "TabLineSel"                = { bg = "NONE"; };

    # Splits and sign column
    "VertSplit"                 = { bg = "NONE"; };
    "WinSeparator"              = { bg = "NONE"; };
    "SignColumn"                = { bg = "NONE"; };
    "FoldColumn"                = { bg = "NONE"; };

    # Popups and menus
    "Pmenu"                     = { bg = "NONE"; };
    "PmenuSbar"                 = { bg = "NONE"; };
    "PmenuThumb"                = { bg = "NONE"; };
    "WildMenu"                  = { bg = "NONE"; };
    "WinBar"                    = { bg = "NONE"; };
    "WinBarNC"                  = { bg = "NONE"; };

    # Render-Latex
    "Conceal"                   = { bg = "NONE"; };
    "Special"                   = { fg = "#ff7eb6"; };

    "GitGutterAdd"               = { bg = "NONE"; };
    "GitGutterChange"            = { bg = "NONE"; };
    "GitGutterDelete"            = { bg = "NONE"; };
    "GitGutterChangedelete"      = { bg = "NONE"; };
    "GitGutterTopdelete"         = { bg = "NONE"; };
    "GitGutterUntracked"         = { bg = "NONE"; };

    # End of buffer
    "EndOfBuffer"               = { bg = "NONE"; };
  };
}
