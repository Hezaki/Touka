{
  pkgs,
  config,
  inputs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.default;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
    plugins = with pkgs.vimPlugins; [ lazy-nvim ];
    extraLuaConfig =
      with config.lib.stylix.colors; # lua
      ''
        local api = vim.api
        local cmd = vim.cmd
        local opt = vim.opt
        local map = vim.keymap.set

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
        vim.g.mapleader = ' '

        map("n", "<TAB>", ":bn<CR>", { silent = true, noremap = true })
        map("n", "<S-TAB>", ":bp<CR>", { silent = true, noremap = true })
        map("n", "<space>", ":nohlsearch<CR>", { silent = true, noremap = true })
        map("n", "<leader><space>", "<cmd>Telescope sort_mru=true sort_lastused=true initial_mode=normal<CR>", { silent = true, noremap = true })
        map("n", "fg", "<cmd>Telescope live_grep sort_mru=true initial_mode=normal<CR>", { silent = true, noremap = true })
        map("n", "ff", "<cmd>Telescope fd sort_mru=true sort_lastused=true initial_mode=normal<CR>", { silent = true, noremap = true })
        map("n", "fr", "<cmd>Telescope oldfiles sort_mru=true sort_lastused=true initial_mode=normal<CR>", { silent = true, noremap = true })
        map("n", "fd", "<cmd>Telescope zoxide list sort_mru=true sort_lastused=true initial_mode=normal<CR>", { silent = true, noremap = true })
        map("n", "fb", ":Yazi<CR>", { silent = true, noremap = true })
        map("n", "<S-t>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR><CR>", { silent = true, noremap = true })
        map("n", "<leader>w", ":BufferLinePickClose<CR>", { silent = true, noremap = true })
        map("n", "<leader>z", ":ZenMode<CR>", { silent = true, noremap = true })
        map("n", "<leader>f", vim.lsp.buf.format, { silent = true, noremap = true })
        map("n", "<leader>r", ":IncRename ")
        map("n", "<PageUp>", ":lua require('neoscroll').ctrl_u({ duration = 250 })<CR>", { silent = true, noremap = true })
        map("n", "<PageDown>", ":lua require('neoscroll').ctrl_d({ duration = 250 })<CR>", { silent = true, noremap = true })
        map("n", "<PageDown>", ":lua require('neoscroll').ctrl_d({ duration = 250 })<CR>", { silent = true, noremap = true })
        map('i', '<C-H>', '<C-w>', { silent = true, noremap = true })

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
          local path = vim.fn.pathshorten(vim.fn.expand("%:p:h"))
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

        vim.diagnostic.config {
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.INFO] = " ",
              [vim.diagnostic.severity.HINT] = " ",
            },
            linehl = {
              [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
              [vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
              [vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
              [vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
            },
            numhl = {
              [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
              [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
              [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
              [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            },
          },
        }

        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        opt.rtp:prepend(lazypath)

        require("lazy").setup({
          spec = {
            {
              'karb94/neoscroll.nvim',
              lazy = false,
              opts = {
                mappings = {                 
                  '<C-u>', '<C-d>',
                  '<C-b>', '<C-f>',
                  '<C-y>', '<C-e>',
                  'zt', 'zz', 'zb',
                },
                hide_cursor = false,
                stop_eof = true,             
                respect_scrolloff = false,  
                cursor_scrolls_alone = true,
                duration_multiplier = 0.1,
                easing = 'linear',
                pre_hook = nil,
                post_hook = nil,
                performance_mode = false,
                ignored_events = {
                  'WinScrolled', 'CursorMoved'
                },
              },
            },
            {
              'aveplen/ruscmd.nvim',
              event = "VeryLazy",
              opts = {},
            },
            {
              "smjonas/inc-rename.nvim",
              event = "VeryLazy",
              opts = {
                cmd_name = "IncRename",
                hl_group = "Substitute",
                preview_empty_name = false,
                show_message = true,
                save_in_cmdline_history = true,
                input_buffer_type = nil,
                post_hook = nil,
              },
            },
            {
              'danilamihailov/beacon.nvim',
              event = "VeryLazy",
              opts = {},
            },
            {
              "j-hui/fidget.nvim",
              event = "VeryLazy",
              opts = {},
            },
            {
              "wurli/contextindent.nvim",
              event = "VeryLazy",
              opts = { pattern = "*" },
              dependencies = { "nvim-treesitter/nvim-treesitter" },
            },
            { 
              'glacambre/firenvim', 
              build = ":call firenvim#install(0)" 
            },
            {
              'HiPhish/rainbow-delimiters.nvim',
              config = function()
                local rainbow_delimiters = require 'rainbow-delimiters'
                vim.g.rainbow_delimiters = {
                  strategy = {
                    [""] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                  },
                  query = {
                    [""] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                  },
                  priority = {
                    [""] = 110,
                    lua = 210,
                  },
                  highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                  },
                }
              end
            },
            {
              'nvim-treesitter/nvim-treesitter',
              event = "VeryLazy",
              build = ":TSUpdate",
              config = function()
                require'nvim-treesitter.configs'.setup {
                  ensure_installed = { "lua", "nix", "css", "json", },
                  sync_install = true,
                  auto_install = true,
                  highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = true,
                  },
                  indent = {
                    enable = true,
                  },
                  incremental_selection = {
                    enable = true,
                  },
                }
              end
            },
            {
              'm-demare/hlargs.nvim',
              event = 'VeryLazy',
              opts = {
                color = '#${base0C}',
              },
            },
            {
              'goolord/alpha-nvim',
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
                  "  ⠸⢯⡿⠾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠫⠋⠀  ",
                  "",
                  ""
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
              event = "VeryLazy",
              opts = {},
            },
            {
              'windwp/nvim-autopairs',
              event = "VeryLazy",
              opts = {},
            },
            {
              'nvim-telescope/telescope.nvim',
              dependencies = {
                'nvim-lua/plenary.nvim',
                'jvgrootveld/telescope-zoxide',
                "nvim-telescope/telescope-frecency.nvim",
              },
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
                  -- mappings = {
                  --   n = {
                  --     ["d"] = require("telescope.actions").delete_buffer,
                  --   },
                  -- },
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
                    ruler = true,
                    showcmd = false,
                    laststatus = 0,
                  },
                  gitsigns = { enabled = true },
                  tmux = { enabled = true },
                },
              },
            },
            {
              'norcalli/nvim-colorizer.lua',
              event = "VeryLazy",
              config = function()
                require"colorizer".setup()
              end,
            },
            {
              'hrsh7th/nvim-cmp',
              event = "VeryLazy",
              dependencies = {
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-cmdline',
              },
              config = function()
                local cmp = require'cmp'
                cmp.setup({
                  snippet = {
                    expand = function(args)
                      local present, luasnip = pcall(require, "luasnip")
                      if present then
                        luasnip.lsp_expand(args.body)
                      end
                    end,
                  },
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
                    { name = "luasnip" },
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
                           expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.think.options',
                        },
                        home_manager = {
                           expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."hezaki".options',
                        },
                      },
                    },
                  },
                }
                require'lspconfig'.lua_ls.setup {
                  on_init = function(client)
                    if client.workspace_folders then
                      local path = client.workspace_folders[1].name
                      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
                        return
                      end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                      runtime = {
                        version = 'LuaJIT'
                      },
                      workspace = {
                        checkThirdParty = false,
                        library = {
                          vim.env.VIMRUNTIME
                        }
                      }
                    })
                  end,
                  settings = {
                    Lua = {}
                  }
                }
              end
            },
            {
              'lewis6991/gitsigns.nvim',
              event = "VeryLazy",
              opts = {},
            },
            {
              'L3MON4D3/LuaSnip',
              event = "VeryLazy",
              dependencies = {
                'rafamadriz/friendly-snippets',
                'saadparwaiz1/cmp_luasnip',
              },
              version = "v2.*",
              config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
              end
            },
            {
              'echasnovski/mini.cursorword', 
              event = "VeryLazy",
              version = false,
              opts = {
                delay = 100,
              },
            },
            {
              'echasnovski/mini.splitjoin',
              event = "VeryLazy",
              version = false,
              opts = {
                mappings = {
                  toggle = "gS",
                  split = "",
                  join = "",
                },
                detect = {
                  brackets = nil,
                  separator = ',',
                  exclude_regions = nil,
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
          hi RainbowDelimiterRed guifg=#${base08}
          hi RainbowDelimiterYellow guifg=#${base09}
          hi RainbowDelimiterBlue guifg=#${base0D}
          hi RainbowDelimiterOrange guifg=#${base0A}
          hi RainbowDelimiterGreen guifg=#${base0B}
          hi RainbowDelimiterViolet guifg=#${base0E}
          hi RainbowDelimiterCyan guifg=#${base0C}

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
