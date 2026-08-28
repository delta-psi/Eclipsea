
{
  markview = {
    enable = true;
    settings = {
      preview = {
        conceallevel = 2;
        icon_provider = "devicons";
        hybrid_mode = {
          enable = true;
        };
        callbacks = {
          on_attach = {
            __raw = ''
              function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "nc"
              end
            '';
          };
          on_enable = {
            __raw = ''
              function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "nc"
              end
            '';
          };
          on_render = {
            __raw = ''
              function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "nc"
              end
            '';
          };
          on_mode_change = {
            __raw = ''
              function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "nc"
              end
            '';
          };
        };
      };
      markdown = {
        headings.enable = true;
        tables.enable = true;
        code_blocks = {
          enable = true;
          style = "block";
        };
        list_items.enable = true;
        checkboxes.enable = true;
        block_quotes.wrap = false;
        headings.org_indent_wrap = false;
        list_items.wrap = false;
      };
      latex = {
        enable = false;
        blocks = { enable = false; };
        inlines = { 
          enable = false; 
          padding_left = "";
          padding_right = "";
          hl = "Normal";
        };
        subscripts = { enable = false; };
        superscripts = { enable = false; };
        symbols = { enable = false; };
        commands = { enable = false; };
      };
    };
  };


}
