{ pkgs, ... }:{
  programs.neovim = {
    enable = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    extraLuaConfig = ''
      local fn = vim.fn
      local api = vim.api
      local cmd = vim.cmd
      local opt = vim.opt
      local map = vim.keymap.set
      local g = vim.g
      local o = vim.o

      opt.number = true
      opt.title = true
      opt.linebreak = true
      opt.termguicolors = true
      opt.expandtab = true
      opt.undofile = true
      opt.cindent = true
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
      opt.shiftwidth = 2
      opt.cmdheight = 0
      opt.numberwidth = 1
      opt.scrolloff = 5
      opt.laststatus = 3
      opt.pumheight = 0
      opt.tabstop = 2

      cmd([[
        hi StatusLine guibg=0
        hi TabLine guibg=0
        hi TabLineFill guibg=0
        hi TabLineSel guibg=0
        hi VertSplit guifg=2
      ]])

      vim.g.mapleader = ' ',

      map("n", "<TAB>", ":bnext<CR>", { silent = true, noremap = true })
      map("n", "<S-TAB>", ":bprev<CR>", { silent = true, noremap = true })
      map("n", "<space>", ":nohlsearch<CR>", { silent = true, noremap = true })
      map("n", "<leader><space>", ":Telescope<CR>", { silent = true, noremap = true })
      map("n", "fg", ":Telescope live_grep<CR>", { silent = true, noremap = true })
      map("n", "ff", ":Telescope find_files<CR>", { silent = true, noremap = true })
      map("n", "fd", ":Telescope zoxide list<CR>", { silent = true, noremap = true })
      map("n", "<S-t>", ":Telescope buffers<CR>", { silent = true, noremap = true })
      map("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

      local modes = {
        ['n']    = 'NORMAL';
        ['no']   = 'NORMAL';
        ['nov']  = 'NORMAL';
        ['noV']  = 'NORMAL';
        ['no']   = 'NORMAL';
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
        [""]    = 'VISUAL';
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
        ['nix']                = '';
        ['org']                = ''
      }

      local kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
      }

      local signs = { Error = "", Warn = "", Hint = "", Info = "", }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end

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
          return string.format("   " .. branch)
        else
          return ""
        end
      end

      Status = function()
        return table.concat {
          color(),
          string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
          "%#StatusActive#",
          branch(),
          "%=",
          string.format("%s", (icons[vim.bo.filetype] or "")),
          " %f ",
          color(),
          " %l:%c  ",
        }
      end

      api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
        pattern = "*",
        command = "setlocal statusline=%!v:lua.Status()",
      })

      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      opt.rtp:prepend(lazypath)

      require("lazy").setup({
        spec = {
          { 
            'romgrk/barbar.nvim',
            init = function() vim.g.barbar_auto_setup = false end,
            dependencies = 'nvim-tree/nvim-web-devicons',
            opts = {
              preset = 'default',
              clickable = false,
              icons = {
                button = "",
                modified = { button = '●' },
                pinned = { 
                  button = '',
                  filename = true,
                },
                separator_at_end = false,
                separator = {
                  right = "",
                  left = "",
                },
                buffer_index = false,
                buffer_number = false,
                diagnostics = {
                  [ vim.diagnostic.severity.WARN ] = { enabled = false },
                  [ vim.diagnostic.severity.INFO ] = { enabled = false },
                  [ vim.diagnostic.severity.HINT ] = { enabled = true },
                  [ vim.diagnostic.severity.ERROR ] = {
                    enabled = true,
                    icon = 'ﬀ',
                  },
                },
                gitsigns = {
                  added = { 
                    enabled = true,
                    icon = '+',
                  },
                  changed = {
                    enabled = true,
                    icon = '~',
                  },
                  deleted = {
                    enabled = true,
                    icon = '-',
                  },
                },
                filetype = {
                  custom_colors = false,
                  enabled = true,
                },
              },
              sidebar_filetypes = {
                NvimTree = true,
              },
            },
          },
          {
            "lukas-reineke/indent-blankline.nvim",
            event = 'VeryLazy',
            main = "ibl",
            opts = {
              indent = { char="│" },
              exclude = {
                filetypes = {
                  "help",
                  "terminal",
                  "dashboard",
                  "packer",
                  "TelescopePrompt",
                  "TelescopeResults",
                },
                buftypes = { "terminal", "nofile" },
              },
              scope= { enabled = false }
            },
          },
          {
            'nvim-treesitter/nvim-treesitter',
            'm-demare/hlargs.nvim',
            event = 'VeryLazy',
            opts = {
              ensure_installed = {
                "all",
              },
              highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
              },
            },
          },
          {
            'windwp/nvim-autopairs',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
            'jvgrootveld/telescope-zoxide',
            "nvim-telescope/telescope-frecency.nvim",
            event = 'VeryLazy',
            opts = {
              defaults = {
                file_ignore_patterns = {
                  "%.mp4",
                  "%.jpg",
                  "%.jpeg",
                  "%.png",
                  "%.otf",
                  "%.ttf",
                  "node_modules",
                },
                prompt_prefix = " ",
                selection_caret = "",
                entry_prefix = " ",
                layout_strategy = "flex",
                layout_config = {
                  horizontal = {
                    preview_width = 0.6,
                  },
                },
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
              },
            },
          },
          {
            'nvim-tree/nvim-tree.lua',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'nvim-orgmode/orgmode',
            event = 'VeryLazy',
            ft = { 'org' },
            opts = {
              org_agenda_files = '~/Documents/Notes',
            },
          },
          {
            'akinsho/org-bullets.nvim';
            event = 'VeryLazy',
            opts = {},
          },
          {
            'lukas-reineke/headlines.nvim',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'norcalli/nvim-colorizer.lua',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'hrsh7th/nvim-cmp',
            dependencies = {
              'hrsh7th/cmp-buffer',
              'hrsh7th/cmp-path',
              'hrsh7th/cmp-nvim-lsp',
              'hrsh7th/cmp-cmdline',
            },
            event = "InsertEnter",
            config = function()
              local cmp = require'cmp'
              cmp.setup({
                window = {
                  completion = {
                    winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
                    scrollbar = false,
                    border = {
                      "╭",
                      "─",
                      "╮",
                      "│",
                      "╯",
                      "─",
                      "╰",
                      "│",
                    },
                  },
                  documentation = {
                    border = {
                      "╭",
                      "─",
                      "╮",
                      "│",
                      "╯",
                      "─",
                      "╰",
                      "│",
                    },
                  },
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<Esc>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    else
                      fallback()
                    end
                  end, { "i", "s" }),

                  ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    else
                      fallback()
                    end
                  end, { "i", "s" }),

                }),
                formatting = {
                  fields = {'abbr', 'menu', 'kind'},
                  format = function(entry, vim_item)
                    vim_item.kind = kind_icons[vim_item.kind]
                    vim_item.menu = ({
                      buffer = "[Buf]",
                      path = "[Path]",
                      nvim_lsp = "[Lsp]",
                      luasnip = "[Snip]",
                      cmdline = "[Cmd]",
                      nvim_lua = "[Lua]",
                    })[entry.source.name]
                    return vim_item
                  end,
                 },
                sources = cmp.config.sources({
                  { name = "nvim_lsp" },
                  { name = "path" },
                  { name = "buffer" },
                  { name = "emoji" },
                }),
                cmp.setup.cmdline(':', {
                  mapping = cmp.mapping.preset.cmdline(),
                  sources = cmp.config.sources({
                    { name = 'path' }
                  }, {
                    {
                      name = 'cmdline',
                    },
                  }),
                }),
                cmp.setup.cmdline('/', {
                  mapping = cmp.mapping.preset.cmdline(),
                  sources = {
                    { name = 'buffer' },
                  },
                }),
              })
            end
          },
          {
            'neovim/nvim-lspconfig',
            event = 'VeryLazy',
            config = function()
              require('lspconfig')['nil_ls'].setup{
                on_attach = on_attach,
                flags = lsp_flags,
              }
              require('lspconfig')['lua_ls'].setup{
                on_attach = on_attach,
                flags = lsp_flags,
              }
            end
          },
        },
      })
    '';
  };
}
