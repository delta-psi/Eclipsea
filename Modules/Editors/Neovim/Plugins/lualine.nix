{
  lualine = {
    enable = true;
    settings = {
      options = {
        theme = {
          __raw = ''
            (function()
              local colors = {
                blue   = '#80a0ff',
                cyan   = '#79dac8',
                black  = '#080808',
                white  = '#c6c6c6',
                red    = '#ff5189',
                violet = '#d183e8',
                grey   = '#303030',
              }
              return {
                normal = {
                  a = { fg = colors.black,  bg = colors.violet, gui = "italic,bold" },
                  b = { fg = colors.white,  bg = colors.grey, gui = "italic" },
                  c = { fg = colors.white, gui = "italic" },
                },
                insert  = { a = { fg = colors.black, bg = colors.blue, gui = "italic,bold" } },
                visual  = { a = { fg = colors.black, bg = colors.cyan, gui = "italic,bold" } },
                replace = { a = { fg = colors.black, bg = colors.red, gui = "italic,bold" } },
                inactive = {
                  a = { fg = colors.white, bg = colors.black, gui = "italic" },
                  b = { fg = colors.white, bg = colors.black, gui = "italic" },
                  c = { fg = colors.white, gui = "italic" },
                },
              }
            end)()
          '';
        };
        component_separators = "";
        section_separators = {
          left  = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [
          { __unkeyed-1 = "mode"; separator = { left = ""; }; right_padding = 2; }
        ];
        lualine_b = [ "filename" "branch" ];
        lualine_c = [ "fileformat" ];
        lualine_x = [ "diff" ];
        lualine_y = [ "filetype" "encoding" ];
        lualine_z = [
          { __unkeyed-1 = "location"; separator = { right = ""; }; left_padding = 2; }
        ];
      };
      inactive_sections = {
        lualine_a = [ "filename" ];
        lualine_b = [];
        lualine_c = [];
        lualine_x = [];
        lualine_y = [];
        lualine_z = [ "location" ];
      };
      tabline = {
        lualine_a = [
          { __unkeyed-1 = "buffers"; separator = { left = ""; right = ""; }; } 
        ];
        lualine_b = [];
        lualine_c = [];
        lualine_x = [];
        lualine_y = [];
        lualine_z = [
        ];
      };
    };
  };
}
