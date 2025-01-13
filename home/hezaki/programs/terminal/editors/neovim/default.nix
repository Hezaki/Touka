{
  pkgs,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
    plugins = with pkgs.vimPlugins; [ lazy-nvim ];
    extraLuaConfig = with config.lib.stylix.colors; ''
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

      vim.loader.enable()
      vim.g.mapleader = ' ',

      map("n", "<TAB>", ":bn<CR>", { silent = true, noremap = true })
      map("n", "<S-TAB>", ":bp<CR>", { silent = true, noremap = true })
      map("n", "<space>", ":nohlsearch<CR>", { silent = true, noremap = true })
      map("n", "<leader><space>", ":Telescope<CR>", { silent = true, noremap = true })
      map("n", "fg", ":Telescope live_grep<CR>", { silent = true, noremap = true })
      map("n", "ff", ":Telescope fd<CR>", { silent = true, noremap = true })
      map("n", "fr", ":Telescope oldfiles<CR>", { silent = true, noremap = true })
      map("n", "fd", ":Telescope zoxide list<CR>", { silent = true, noremap = true })
      map("n", "fb", ":Yazi<CR>", { silent = true, noremap = true })
      map("n", "<S-t>", ":Telescope buffers<CR>", { silent = true, noremap = true })
      map("n", "<leader>w", ":BufferLinePickClose<CR>", { silent = true, noremap = true })
      map("n", "<leader>z", ":ZenMode<CR>", { silent = true, noremap = true })
      map("n", "<leader>f", vim.lsp.buf.format, { silent = true, noremap = true })

      local kind_icons = {
        Text = " ",
        Method = "󰆧",
        Function = "ƒ ",
        Constructor = " ",
        Field = "󰜢 ",
        Variable = " ",
        Constant = " ",
        Class = " ",
        Interface = "󰜰 ",
        Struct = " ",
        Enum = "了 ",
        EnumMember = " ",
        Module = "",
        Property = " ",
        Unit = " ",
        Value = "󰎠 ",
        Keyword = "󰌆 ",
        Snippet = " ",
        File = " ",
        Folder = " ",
        Color = " ",
      }

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
        local cmd = io.popen('git branch --show-current 2>/dev/null ')
        local branch = cmd:read("*l") or cmd:read("*a")
        cmd:close()
        if branch ~= "" then
          return string.format("  " .. branch)
        else
          return ""
        end
      end

      Status = function()
        return table.concat {
          color(),
          string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
          "%#StatusActive#",
          " %{expand('%:p:h')} ",
          branch(),
          "%=",
          color(),
          " %l:%c  ",
        }
      end

      api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
        pattern = "*",
        command = "setlocal statusline=%!v:lua.Status()",
      })

      local signs = { Error = "", Warn = "", Hint = "", Info = "", }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end

      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      opt.rtp:prepend(lazypath)

      require("lazy").setup({
        spec = {
          {
            'goolord/alpha-nvim',
            lazy = false,
            config = function()
              local status_ok, alpha = pcall(require, "alpha")
              if not status_ok then
                return
              end


              if vim.fn.has("win32") == 1 then
                plugins_count = vim.fn.len(vim.fn.globpath("~/AppData/Local/nvim-data/site/pack/packer/start", "*", 0, 1))
              else
                plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
              end

              local dashboard = require("alpha.themes.dashboard")
              dashboard.section.header.val = {
                "",
                "",
                "",
                "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
                "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣦⡀⠀⠀⠀⠀⠀⠀  ",
                "  ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣀⣀⡀⠀⠀⠀⠹⣿⣦⡀⠀⠀⠀⠀  ",
                "  ⠀⠀⠀⠀⠀⢀⣴⣿⣻⣞⣷⡻⠉⠀⠀⠀⠀⠀⠱⣟⣿⣦⠀⠀⠀  ",
                "  ⠀⠀⠀⢀⣴⣿⣻⣾⣽⣻⣎⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⢯⣧⠀⠀  ",
                "  ⠀⠀⠐⢿⣯⡷⣟⡾⠳⡿⣽⡷⣄⠀⠀⠀⠀⠀⠀⠀⢻⣯⣟⣇⠀  ",
                "  ⠀⠀⠀⠀⠙⠽⠋⠀⠀⠈⠻⣽⣟⡷⣄⠀⠀⠀⠀⠀⠘⣷⣯⢿⠀  ",
                "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣽⣟⡷⣄⠀⠀⠀⢠⣿⢾⡿⠀  ",
                "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣽⣟⡷⣄⢀⣾⡽⣯⡏⠀  ",
                "  ⠀⠀⠀⠀⠀⣴⡶⣷⢿⡶⣄⣀⠀⠀⠀⠈⣻⣽⣟⣯⣷⢿⡛⠀⠀  ",
                "  ⠀⠀⣀⣴⣾⢯⠿⠍⠻⣟⣿⣻⣟⣿⣻⢿⣽⡾⣯⣷⣻⢿⣄⠀⠀  ",
                "  ⢀⣾⢿⣽⡾⠏⠀⠀⠀⠀⠉⠓⠋⠷⠿⠯⠗⠛⠁⠉⢻⣟⣾⢷⡄  ",
                "  ⠸⢯⡿⠾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠫⠋⠀  "
              }
              dashboard.section.buttons.val = {
                dashboard.button("ff", "  Find file", ":Telescope find_files<CR>"),
                dashboard.button("fr", "  Old files", ":Telescope oldfiles<CR>"),
                dashboard.button("fb", "󰪶  File browser", ":Yazi<CR>"),
                dashboard.button("fg", "󰈞  Text search", ":Telescope live_grep<CR>"),
                dashboard.button("fd", "󰥨  Find directory", ":Telescope zoxide list<CR>"),
                dashboard.button("S-t", "  Buffers", ":Telescope buffers<CR>"),
              }

              dashboard.section.footer.val = {
                "",
                "--   Sozialismus oder Barbarei   --",
                "",
                "",
                "",
                "",
                ""
              }

              dashboard.section.footer.opts.hl = "Type"
              dashboard.section.header.opts.hl = "Include"
              dashboard.section.buttons.opts.hl = "Keyword"

              dashboard.opts.opts.noautocmd = true
              -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
              alpha.setup(dashboard.opts)
            end
          },
          {
            'akinsho/bufferline.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', },
            opts = {
              options = {
                offsets = {{
                  filetype = "NvimTree",
                  text = "Explorer", 
                  highlight = "Normal"
                }},
                separator_style = { "", "" },
                show_tab_indicators = false,
              },
              highlights = {
                fill = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                background = {
                  fg = "#${base03}",
                  bg = "#${base00}",
                },
                buffer_selected = {
                  fg = "#${base05}",
                  bg = "#${base00}",
                  italic = false,
                },
                buffer_visible = {
                  fg = "#${base03}",
                  bg = "#${base00}",
                },
                close_button = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                close_button_visible = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                close_button_selected = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                indicator_selected = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                indicator_visible = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
                modified = {
                  fg = "#${base0B}",
                  bg = "#${base00}",
                },
                modified_visible = {
                  fg = "#${base0B}",
                  bg = "#${base0B}",
                },
                modified_selected = {
                  fg = "#${base0B}",
                  bg = "#${base00}",
                },
                tab_close = {
                  fg = "#${base00}",
                  bg = "#${base00}",
                },
              }
            };
          },
          {
            'nvimdev/indentmini.nvim',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'nvim-treesitter/nvim-treesitter',
            event = 'VeryLazy',
            build = ":TSUpdate",
            opts = {
              ensure_installed = { "nix" },
              sync_install = false,
              auto_install = true,
              ignore_install = { "javascript" },
              highlight = {
                enable = true,
                disable = { "c", "rust" },
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
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
            dependencies = {
              'nvim-lua/plenary.nvim',
              'jvgrootveld/telescope-zoxide',
              "nvim-telescope/telescope-frecency.nvim",
            },
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
            "mikavilpas/yazi.nvim",
            event = "VeryLazy",
            opts = {},
          },
          {
            "folke/zen-mode.nvim",
            event = "VeryLazy",
            opts = {
              window = {
                backdrop = 0.95, 
                width = .70,
                height = 1,
                options = {
                  signcolumn = "no",
                  number = false,
                },
              },
              plugins = {
                options = {
                  enabled = true,
                  ruler = true, -- disables the ruler text in the cmd line area
                  showcmd = false, -- disables the command in the last line of the screen
                  laststatus = 0, -- turn off the statusline in zen mode
                },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
              },
            },
          },
          {
            'norcalli/nvim-colorizer.lua',
            event = 'VeryLazy',
            config = function()
              require"colorizer".setup()
            end,
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
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│", },
                  },
                  documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│", },
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
                  fields = { 'abbr', 'menu', 'kind' },
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
                    { name = 'cmdline',},
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
              require'lspconfig'.nixd.setup {
                cmd = { "nixd" },
                filetypes = { "nix" },
                single_file_support = true,
                settings = {
                  nixd = {
                    nixpkgs = {
                      expr = "import <nixpkgs> { }",
                    },
                    formatting = {
                      command = { "nixfmt" },
                    },
                    options = {
                      nixos = {
                        expr = '(builtins.getFlake ("/etc/nixos/flake.nix")).nixosConfigurations.think.options',
                      },
                      home_manager = {
                        expr = '(builtins.getFlake ("/etc/nixos/flake.nix")).homeConfigurations."hezaki".options',
                      },
                    },
                  },
                },
              }
              require'lspconfig'.lua_ls.setup {
                on_attach = on_attach,
                flags = lsp_flags,
              }
            end
          },
          {
            'lewis6991/gitsigns.nvim',
            event = 'VeryLazy',
            opts = {},
          },
          {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets', },
            version = "v2.*",
            event = 'VeryLazy',
            opts = {},
          },
          {
            'echasnovski/mini.cursorword', 
            version = false,
            event = 'VeryLazy',
            opts = {
              delay = 100,
            },
          },
          {
            'echasnovski/mini.splitjoin',
            version = false,
            event = 'VeryLazy',
            opts = {
              mappings = {
                toggle = "gS",
                split = "",
                join = "",
              },
            },
          },
          {
            'RRethy/base16-nvim',
            config = function()
              require('base16-colorscheme').with_config({
                telescope = false,
                indentblankline = true,
                notify = true,
                ts_rainbow = true,
                cmp = true,
                illuminate = true,
                dapui = true,
              })
              require('base16-colorscheme').setup({
                base00 = '#${base00}',
                base01 = '#${base01}',
                base02 = '#${base02}',
                base03 = '#${base03}',
                base04 = '#${base04}',
                base05 = '#${base05}',
                base06 = '#${base06}',
                base07 = '#${base07}',
                base08 = '#${base08}',
                base09 = '#${base09}',
                base0A = '#${base0A}',
                base0B = '#${base0B}',
                base0C = '#${base0C}',
                base0D = '#${base0D}',
                base0E = '#${base0E}',
                base0F = '#${base0F}'
              })
            end
          },
        }
      })

      cmd([[
        hi StatusLine guibg=#${base00}
        hi LineNr guifg=#${base03}
        hi CodeBlock guibg=#${base00}
        hi Dash guibg=#${base00} gui=bold
        hi ZenBg guibg=#${base00}
        hi TelescopeBorder guifg=#${base03}
        hi FloatBorder guifg=#${base03}
        hi IndentLine guifg=#${base03}
        hi IndentLineCurrent guifg=#${base03}
      ]])
    '';
  };
}
