{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    viAlias = true;
    extraLuaConfig = ''
      local keymap = vim.keymap
      local fn = vim.fn
      local api = vim.api
      local cmd = vim.cmd
      local opt = vim.opt
      local g = vim.g

      opt.number = true
      opt.title = true
      opt.linebreak = true
      opt.termguicolors = true
      opt.expandtab = true
      vim.opt.undofile = true
      opt.preserveindent = true
      opt.autoindent = true
      opt.cindent = true
      opt.smartindent = true
      opt.smartcase = true
      opt.ignorecase = true
      opt.infercase = true
      opt.showcmd = true
      opt.breakindent = true
      opt.copyindent = true
      opt.cursorline = true
      opt.signcolumn = "yes"
      opt.clipboard = "unnamedplus"
      opt.virtualedit = "block"
      opt.cmdheight = 0
      opt.numberwidth = 1
      opt.scrolloff = 10
      opt.shiftwidth = 2
      opt.laststatus = 3
      opt.pumheight = 0
      opt.tabstop = 2

      keymap.set("n", "<TAB>", ":bnext<CR>", { silent = true, noremap = true })
      keymap.set("n", "<S-TAB>", ":bprev<CR>", { silent = true, noremap = true })
      keymap.set("n", "<C-w>", ":bw<CR>", { silent = true, noremap = true })
      keymap.set("n", "<C-t>", ":tabnew<CR>", { silent = true, noremap = true })
      keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
      keymap.set("n", "<space><space>", ":Telescope<CR>", { silent = true, noremap = true })
      keymap.set("n", "fg", ":Telescope live_grep<CR>", { silent = true, noremap = true })
      keymap.set("n", "ff", ":Telescope find_files<CR>", { silent = true, noremap = true })
      keymap.set("n", "tt", ":Lspsaga term_toggle<CR>", { silent = true, noremap = true })
      keymap.set("n", "<space>r", ":Lspsaga rename<CR>", { silent = true, noremap = true })

      cmd([[ 
        colorscheme catppuccin-mocha
        hi BufferCurrent guibg=0
        hi BufferCurrentSign guibg=0
        hi BufferCurrentMod guibg=0
        hi BufferCurrentWARN guibg=0
        hi BufferCurrentHINT guibg=0
        hi BufferInactiveSign guifg=bg
        hi BufferInactiveMod guifg=#45475a
        hi BufferInactiveWARN guibg=#45475a
        hi BufferInactiveHINT guibg=#45475a
        hi VertSplit guibg=bg guifg=#45475a
        hi NvimTreeWinSeparator guifg=#45475a
        hi CursorLineNr gui=bold guibg=#2A2B3C
      ]])

      local signs = { Error = ""; Warn = ""; Hint = ""; Info = ""; }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end

      local modes = {
        ['n']    = 'NORMAL';
        ['no']   = 'NORMAL';
        ['nov']  = 'NORMAL';
        ['noV']  = 'NORMAL';
        ['no'] = 'NORMAL';
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
        [""]  = 'VISUAL';
        ['r']   = 'VISUAL';
        ['r?']  = 'VISUAL';

        ['c']   = 'TERMINAl';
        ['t']   = 'TERMINAL';
        ['!']   = 'TERMINAL';
        ['R']   = 'TERMINAL';
      }

      local icons = {
        ['typescript']         = '';
        ['python']             = '';
        ['java']               = '';
        ['html']               = '';
        ['css']                = '';
        ['scss']               = '';
        ['javascript']         = '';
        ['javascriptreact']    = '';
        ['markdown']           = '';
        ['sh']                 = '';
        ['zsh']                = '';
        ['vim']                = '';
        ['rust']               = '';
        ['cpp']                = '';
        ['c']                  = '';
        ['go']                 = '';
        ['lua']                = '';
        ['conf']               = '';
        ['haskel']             = '';
        ['ruby']               = '';
        ['txt']                = '';
        ['nix']                = ''
      }

      local function color()
        local mode = api.nvim_get_mode().mode
        local mode_color = "%#StatusLine#"
        if mode == "n" then
          mode_color = "%#StatusNormal#"
        elseif mode == "i" or mode == "ic" then
          mode_color = "%#StatusInsert#"
        elseif mode == "v" or mode == "V" or mode == "" then
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
          color(); -- mode colors
          string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(); -- mode
          "%#StatusActive#"; -- middle color
          branch();
          "%="; -- right align
          string.format("%s", (icons[vim.bo.filetype] or ""));
          " %f ";
          color(); -- mode colors
          " %l:%c  "; -- line, column
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

      require("Comment").setup{}
      require("luasnip").config.set_config({})
      require('gitsigns').setup({})
 	    require("catppuccin").setup {
        term_colors = true,
	      color_overrides = {
	        mocha = { base = "#1e1e2e"; mantle = "#1e1e2e"; crust = "#1e1e2e"; };
	      };
	    }
      require("zen-mode").setup {
        window = {
          width = .80 
        }
      }
      require('nvim-autopairs').setup({
        ["check_ts"] = true
      })
      require('nvim-cursorline').setup({
        ["cursorline"] = {
          ["enable"] = false
        }
      })
      require('colorizer').setup{'*';}
      require("null-ls").setup({
        ["cmd"] = { "bash -c nvim" },
        ["debug"] = true,
        ["sources"] = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.nixpkgs_fmt,
          require("null-ls").builtins.formatting.alejandra,
          require("null-ls").builtins.diagnostics.statix,
          require("null-ls").builtins.diagnostics.deadnix,
          require("null-ls").builtins.code_actions.statix
        }
      })
      require('lspsaga').setup({
        ["emmet"] = {["enable"] = true},
        ["lightbulb"] = {["enable"] = false},
        ["symbol_in_winbar"] = {["enable"] = false}
      })
      require('nvim-tree').setup({
        ["diagnostics"] = {["enable"] = true},
        ["disable_netrw"] = true,
        ["git"] = {
          ["enable"] = true,
          ["show_on_dirs"] = true
        },
        ["hijack_cursor"] = true,
        ["hijack_directories"] = {["auto_open"] = false},
        ["hijack_netrw"] = true,
        ["view"] = {["width"] = 25}
      })
      require('nvim-treesitter.configs').setup({
        ["autotag"] = {["enable"] = true},
        ["highlight"] = {["enable"] = true},
        ["indent"] = {["enable"] = true}
      })
      require('telescope').setup({
        ["defaults"] = {
          ["layout_config"] = {
            ["height"] = 0.800000,
            ["horizontal"] = {["preview_width"] = 0.550000},
            ["preview_cutoff"] = 120,
            ["vertical"] = {["mirror"] = false},
            ["width"] = 0.870000
          },
          ["path_display"] = {"truncate"},
          ["prompt_prefix"] = " ",
          ["selection_caret"] = "❯ "
        },
        ["pickers"] = {["colorscheme"] = {["enable_preview"] = true}}
      })
    '';
    plugins = with pkgs; with pkgs.vimPlugins; [
      catppuccin-nvim
      auto-pairs
      emmet-vim
      colorizer
      telescope-nvim
      telescope-zoxide
      telescope-frecency-nvim
      nvim-tree-lua
      barbar-nvim
      nvim-cursorline
      nvim-treesitter 
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      nvim-lspconfig
      nvim-cmp
      nvim-ts-autotag
      nvim-autopairs
      lspsaga-nvim
      lspkind-nvim
      none-ls-nvim
      zoxide-vim
      zen-mode-nvim
      comment-nvim
      gitsigns-nvim
      statix
      deadnix
      alejandra
      stylua
      nixpkgs-fmt
      luasnip
      nixd
      nil
      nodePackages_latest.pyright
      tailwindcss
    ];
  };
}
