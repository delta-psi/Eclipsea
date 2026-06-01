
{
  keymaps = [
    { 
      mode = "n"; 
      key = "<S-l>"; 
      action = ":bnext<cr>"; 
      options.desc = "Next Buffer"; 
    }
    { 
      mode = "n"; 
      key = "<S-h>"; 
      action = ":bprev<cr>"; 
      options.desc = "Previous Buffer"; 
    }
    { 
      mode = "n"; 
      key = "<leader>v"; 
      action = "<cmd>vsplit<cr>"; 
      options.desc = "Vertical Split"; 
    }
    { 
      mode = "n"; 
      key = "<leader>s"; 
      action = "<cmd>split<cr>"; 
      options.desc = "Horizontal Split"; 
    }
    { 
      mode = "n"; 
      key = "<leader>e"; 
      action = "<cmd>lua Snacks.explorer()<cr>"; 
      options.desc = "File Tree"; 
    }
    { 
      mode = [ "n" "t" ]; 
      key = "<C-\\>"; 
      action = "<cmd> lua Snacks.terminal.toggle()<cr>"; 
      options.desc = "Toggle Terminal"; 
    } 
    { 
      mode = "n"; 
      key = "<leader>bd"; 
      action = "<cmd> lua Snacks.bufdelete()<cr>"; 
      options.desc = "Delete current buffer"; 
    }
    { 
      mode = "n"; 
      key = "<leader>ba"; 
      action = "<cmd> lua Snacks.bufdelete.all()<cr>"; 
      options.desc = "Delete all buffers"; 
    }
    { 
      mode = "n"; 
      key = "<leader>bo"; 
      action = "<cmd> lua Snacks.bufdelete.other()<cr>"; 
      options.desc = "Delete all except the current buffer"; 
    }

    {
		 mode = "n";
		 key = "<leader>lr";
		 action.__raw = ''function() require("markdown-latex-render.render").rerender_buf() end'';
		}
    { 
      mode = "n"; 
      key = "<leader><space>"; 
      action = "<cmd>lua Snacks.picker.smart()<cr>"; 
      options.desc = "File Explorer"; 
    }
    { 
      mode = "n"; 
      key = "<leader>n"; 
      action = "<cmd>lua Snacks.notifier.show_history()<cr>"; 
      options.desc = "Show notifcations history"; 
    }
    {
		 mode = "n";
		 key = "<leader>h";
		 action = "<cmd>lua Snacks.health.check()<cr>";
		 options.desc = "Health Check";
		}

    # Resize with arrows
    {
		 mode = "n";
		 key = "<C-Up>";
		 action = "<cmd>resize -2<cr>";
		}
    {
		 mode = "n";
		 key = "<C-Down>";
		 action = "<cmd>resize +2<cr>";
		}
    {
		 mode = "n";
		 key = "<C-Left>";
		 action = "<cmd>vertical resize -2<cr>";
		}
    {
		 mode = "n";
		 key = "<C-Right>";
		 action = "<cmd>vertical resize +2<cr>";
		}

    {
		 mode = "n";
		 key = "<leader>d";
		 action = "<cmd>lua vim.diagnostic.open_float()<cr>";
		 options.desc = "Show Diagnostic";
		}
  ];
}
