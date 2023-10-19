{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    viAlias = true;

    options = {
      number = true;
      title = true;
      linebreak = true;
      termguicolors = true;
      expandtab = true;
      swapfile = false;
      undofile = true;
      showmode = false;
      relativenumber = false;
      preserveindent = true;
      autoindent = true;
      cindent = true;
      smartindent = true;
      smartcase = true;
      ignorecase = true;
      infercase = true;
      ruler = false;
      showcmd = true;
      breakindent = true;
      copyindent = true;
      cursorline = true;
      smarttab = false;
      foldenable = false;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      virtualedit = "block";
      numberwidth = 1;
      cmdheight = 0;
      scrolloff = 10;
      shiftwidth = 2;
      laststatus = 3;
      pumheight = 0;
      tabstop = 2;
    };

    globals.mapleader = " ";

    maps = {
      normal = {
        "<SPACE>" = {
          action = ":nohlsearch<CR>";
          noremap = true;
          silent = true;
        };
        "<TAB>" = {
          action = ":bnext<CR>";
          noremap = true;
          silent = true;
        };
        "<S-TAB>" = {
          action = ":bprev<CR>";
          noremap = true;
          silent = true;
        };
        "<C-N>" = {
          action = ":NvimTreeToggle<CR>";
          noremap = true;
          silent = true;
        };
        "<leader><space>" = {
          action = ":Telescope<CR>";
          noremap = true;
          silent = true;
        };
        "ff" = {
          action = ":Telescope find_files<CR>";
          noremap = true;
          silent = true;
        };
      };
    };

    plugins = {
      nix.enable = true;
	    emmet.enable = true;
      ts-autotag.enable = true;
      comment-nvim.enable = true;
      telescope.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree = {
        enable = true;
        disableNetrw = true;
        diagnostics.enable = true;
        git = {
          enable = true;
          showOnDirs = true;
        };
      };
      neorg = {
        enable = true;
        package = pkgs.vimPlugins.neorg;
        lazyLoading = true;
        modules = {
          "core.defaults" = {};
          "core.keybinds" = {
            config.default_keybinds = true;
          };
          "core.dirman" = {};
          "core.completion" = {
            config.engine = "nvim-cmp";
          };
          "core.concealer" = {
            config.icon_preset = "varied";
          };
          "core.highlights" = {};
          "core.highlightscore.keybinds" = {};
          "core.integrations.treesitter" = {};
          "core.mode" = {};
          "core.neorgcmd" = {};
          "core.pivot" = {};
          "core.promo" = {};
        };
      };
      markdown-preview = {
        enable = true;
        browser = "firefox";
      };
      barbar = {
	      enable = true;
	      animation = true;
	      clickable = true;
	      tabpages = false;
	      semanticLetters = true;
	      highlightVisible = false;
	      excludeFileNames = ["alpha"];
	      icons = {
	        button = " ";
	        diagnostics = {
	          error.enable = false;
	          hint.enable = true;
	        };
	        separator = {
	          left = " ";
	          right = "";
	        };
	        filetype = {
	          enable = true;
	          customColors = true;
	        };
	        modified.button = "●";
	        pinned.button = "";
          inactive.button = " ";
	      };
	      maximumPadding = 1;
	      minimumPadding = 1;
	      maximumLength = 30;
	      sidebarFiletypes = {
	        "NvimTree" = {
            event = "BufWipeout";
            text = " 󰔱 Treexplorer";
	        };
	      };
	    };
      indent-blankline = {
        enable = true;
        useTreesitterScope = true;
      };
      cursorline = {
        enable = true;
        cursorline.enable = false;
      };
      luasnip = {
        enable = true;
        fromVscode = [{ }];
      };
      treesitter = {
        enable = true;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
          tsserver.enable = true;
          html.enable = true;
          cssls.enable = true;
        };
      };
      null-ls = {
        enable = true;
       cmd = ["bash -c nvim"];
        debug = false;
        logLevel = "error";
        sources = {
          code_actions = {
            statix.enable = true;
          };
          diagnostics = {
            statix.enable = false;
            deadnix.enable = false;
          };
          formatting = {
            alejandra.enable = true;
            stylua.enable = true;
            shfmt.enable = false;
            nixpkgs_fmt.enable = true;
            prettier.enable = true;
          };
        };
      };
      lspkind = {
        enable = true;
        mode = "symbol_text";
        cmp.enable = true;
        cmp.ellipsisChar = "...";
        cmp.menu = {
          buffer = "[Buffer]";
          nvim_lsp = "[LSP]";
          path = "[Path]";
          luasnip = "[LuaSnip]";
          nvim_lua = "[Lua]";
          cmdline = "[Cmd]";
          latex_symbols = "[Latex]";
        };
        cmp.maxWidth = 50;
        cmp.after = ''
          function(entry, vim_item, kind)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "   " .. strings[2]
            return kind
          end
        '';
      };
      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lsp_document_symbol";}
          {name = "nvim_lsp_signature_help";}
          {name = "path";}
          {name = "buffer";}
          {name = "emoji";}
        ];
        formatting.fields = [
          "kind"
          "abbr"
          "menu"
        ];
        completion = {
          completeopt = "menuone,noselect,noinsert"; 
        };
        window = {
          documentation.maxHeight = "math.floor(40 * (40 / vim.o.lines))";
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
          };
        };
        mapping = {
          "<TAB>" = "cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_next_item()
                      else
                        fallback()
                      end
                    end)";
          "<S-Tab>" = "cmp.mapping(function(fallback)
                        if cmp.visible() then
                          cmp.select_prev_item()
                        else
                          fallback()
                        end
                      end)";
          "<ESC>" = "cmp.mapping.abort()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
      cmp-emoji.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      zen-mode-nvim
    ];

    extraConfigLua = ''
      fn = vim.fn
      api = vim.api
      cmd = vim.cmd
      opt = vim.opt
      g = vim.g

      require("zen-mode").setup {
        window = {
          width = .80 
        }
      }

 	    require("catppuccin").setup {
	      color_overrides = {
	        mocha = {
	         base = "#1e1e2e";
	         mantle = "#1e1e2e";
	         crust = "#1e1e2e";
	        };
	      };
	    }

      local signs = {
        Error = " ";
        Warn = " ";
        Hint = "";
        Info = " ";
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end

      cmd([[ 
        colorscheme catppuccin-mocha
        hi BufferCurrent guibg=0
        hi BufferCurrentSign guibg=0
        hi BufferCurrentMod guibg=0
        hi BufferCurrentWARN guibg=0
        hi BufferCurrentHINT guibg=0
        hi BufferCurrentWARN guibg=0
        hi BufferInactiveSign guifg=bg
        hi VertSplit guibg=bg guifg=#45475a
        hi NvimTreeWinSeparator guifg=#45475a
        hi ZenBg guibg=0
      ]])

      local modes = {
        ['n']    = 'NORMAL';
        ['no']   = 'NORMAL';
        ['nov']  = 'NORMAL';
        ['noV']  = 'NORMAL';
        ['no'] = 'NORMAL';
        ['niI']  = 'NORMAL';
        ['niR']  = 'NORMAL';
        ['niV']  = 'NORMAL';

        ['i']   = 'INSERT';
        ['ic']  = 'INSERT';
        ['ix']  = 'INSERT';
        ['s']   = 'INSERT';
        ['S']   = 'INSERT';

        ['v']   = 'VISUAL';
        ['V']   = 'VISUAL';
        ['']  = 'VISUAL';
        ['r']   = 'VISUAL';
        ['r?']  = 'VISUAL';

        ['c']   = 'TERMINAl';
        ['t']   = 'TERMINAL';
        ['!']   = 'TERMINAL';
        ['R']   = 'TERMINAL';
      }

      local icons = {
        ['typescript']         = ' ';
        ['python']             = ' ';
        ['java']               = ' ';
        ['html']               = ' ';
        ['css']                = ' ';
        ['scss']               = ' ';
        ['javascript']         = ' ';
        ['javascriptreact']    = ' ';
        ['markdown']           = ' ';
        ['sh']                 = ' ';
        ['zsh']                = ' ';
        ['vim']                = ' ';
        ['rust']               = ' ';
        ['cpp']                = ' ';
        ['c']                  = ' ';
        ['go']                 = ' ';
        ['lua']                = ' ';
        ['conf']               = ' ';
        ['haskel']             = ' ';
        ['ruby']               = ' ';
        ['txt']                = ' ';
        ['nix']                = ' '
      }

      local function color()
        local mode = api.nvim_get_mode().mode
        local mode_color = "%#StatusLine#"
        if mode == "n" then
          mode_color = "%#StatusNormal#"
        elseif mode == "i" or mode == "ic" then
          mode_color = "%#StatusInsert#"
        elseif mode == "v" or mode == "V" or mode == "" then
          mode_color = "%#StatusVisual#"
        elseif mode == "R" then
          mode_color = "%#StatusReplace#"
        elseif mode == "c" then
          mode_color = "%#StatusCommand#"
        elseif mode == "t" then
          mode_color = "%#StatusTerminal#"
        end
        return mode_color
      end

      local function branch()
        local cmd = io.popen('git branch --show-current 2>/dev/null')
        local branch = cmd:read("*l") or cmd:read("*a")
        cmd:close()
        if branch ~= "" then
          return string.format("   " .. branch)
        else
          return ""
        end
      end

      -- StatusLine Modes
      Status = function()
        return table.concat {
          color(), -- mode colors
          string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
          "%#StatusActive#", -- middle color
          branch(),
          -- " %f ", -- file name
          "%=", -- right align
          string.format("%s", (icons[vim.bo.filetype] or "")),
          " %f ",
          color(), -- mode colors
          " %l:%c  ", -- line, column
        }
      end

      -- Execute statusline
      api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
        pattern = "*";
        command = "setlocal statusline=%!v:lua.Status()";
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
        pattern = "*";
        command = "setlocal statusline=%#StatusLine#";
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave", "WinEnter", "BufEnter", "FileType"}, {
        pattern = {"NvimTree*", "terminal"};
        command = "setlocal statusline=%#StatusNormal#";
      })
    '';
  };
}
