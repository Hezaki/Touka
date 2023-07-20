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
      termguicolors = true;
      expandtab = true;
      swapfile = false;
      undofile = true;
      showmode = false;
      relativenumber = false;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      numberwidth = 1;
      cmdheight = 0;
      scrolloff = 3;
      shiftwidth = 2;
      laststatus = 3;
    };

    globals = {
      mapleader = " ";
    };

    maps = {
      normal = {
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
        "<C-b>" = {
          action = ":NvimTreeFocus<CR>";
          noremap = true;
          silent = true;
        };
        "tt" = {
          action = ":ToggleTerm direction=float<CR>";
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
      bufferline = {
        enable = true;
        bufferCloseIcon = " ";
        highlights = {
          indicatorSelected.bg = "#1e1e2e";
          indicatorSelected.fg = "#1e1e2e";
        };
      };
      comment-nvim = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
      };
      nvim-colorizer = {
        enable = true;
      };
      cursorline = {
        enable = true;
        cursorline = {
          enable = true;
          number = true;
          timeout = 0;
        };
      };
      nvim-autopairs = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
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
      lspsaga = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
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
          completeopt = "menuone,noselect"; 
        };
         mapping = {
          "<TAB>" = "cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_next_item()
                      else
                        fallback()
                      end
                    end)";
          "<ESC>" = "cmp.mapping.abort()";
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim
    ];

    extraConfigLua = ''
      fn = vim.fn
      api = vim.api
      cmd = vim.cmd
      opt = vim.opt
      g = vim.g

      require("catppuccin").setup {
        color_overrides = {
          mocha = {
           base = "#1e1e2e",
           mantle = "#1e1e2e",
           crust = "#1e1e2e",
          },
        },
      }

      local signs = {
        Error = " ",
        Warn = " ",
        Hint = "",
        Info = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end

      cmd([[ 
        colorscheme catppuccin-mocha 
      ]])

      local modes = {
        ['n']    = 'NORMAL',
        ['no']   = 'NORMAL',
        ['nov']  = 'NORMAL',
        ['noV']  = 'NORMAL',
        ['no'] = 'NORMAL',
        ['niI']  = 'NORMAL',
        ['niR']  = 'NORMAL',
        ['niV']  = 'NORMAL',

        ['i']   = 'INSERT',
        ['ic']  = 'INSERT',
        ['ix']  = 'INSERT',
        ['s']   = 'INSERT',
        ['S']   = 'INSERT',

        ['v']   = 'VISUAL',
        ['V']   = 'VISUAL',
        ['']  = 'VISUAL',
        ['r']   = 'VISUAL',
        ['r?']  = 'VISUAL',

        ['c']   = 'TERMINAl',
        ['t']   = 'TERMINAL',
        ['!']   = 'TERMINAL',
        ['R']   = 'TERMINAL',
      }

      local icons = {
        ['typescript']         = ' ',
        ['python']             = ' ',
        ['java']               = ' ',
        ['html']               = ' ',
        ['css']                = ' ',
        ['scss']               = ' ',
        ['javascript']         = ' ',
        ['javascriptreact']    = ' ',
        ['markdown']           = ' ',
        ['sh']                 = ' ',
        ['zsh']                = ' ',
        ['vim']                = ' ',
        ['rust']               = ' ',
        ['cpp']                = ' ',
        ['c']                  = ' ',
        ['go']                 = ' ',
        ['lua']                = ' ',
        ['conf']               = ' ',
        ['haskel']             = ' ',
        ['ruby']               = ' ',
        ['txt']                = ' ',
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
        pattern = "*",
        command = "setlocal statusline=%!v:lua.Status()",
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
        pattern = "*",
        command = "setlocal statusline=%#StatusLine#",
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave", "WinEnter", "BufEnter", "FileType"}, {
        pattern = {"NvimTree*", "terminal"},
        command = "setlocal statusline=%#StatusNormal#",
      })
    '';
  };
}
