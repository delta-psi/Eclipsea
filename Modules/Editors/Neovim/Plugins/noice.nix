
{
  noice = {
    enable = true;
    autoLoad = true;
    settings = {
      presets = {
        bottom_search = false;
        command_palette = true;
        inc_rename = false;
        long_message_to_split = false;
        lsp_doc_border = true;
      };
      cmdline = {
        enabled = true;
        view = "cmdline_popup";
      };
      messages = {
        enabled = true;
      };
      notify = {
        enabled = true;
      };
      popupmenu = {
        enabled = true;
        backend = "nui";
        kind_icons = { };
      };
      views = {
        cmdline_popup = {
          position = {
            row = "50%";
            col = "50%";
          };
          size = {
            width = 60;
            height = "auto";
          };
        };
        popupmenu = {
          relative = "editor";
          zindex = 65;
          position = {
            row = "53%";
            col = "50%";
          };
          size = {
            width = 60;
            height = "auto";
            max_height = 10;
          };
          border = {
            style = "rounded";
            padding = [ 0 1 ];
          };
          win_options = {
            winhighlight = {
              Normal = "NormalFloat";
              FloatBorder = "FloatBorder";
            };
          };
        };
      };
    };
  };
}
