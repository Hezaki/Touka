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
    defaultEditor = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
    plugins = with pkgs.vimPlugins; [ lazy-nvim ];

    initLua =
      with config.lib.stylix.colors; # lua
      ''
        local api = vim.api
        local cmd = vim.cmd
        local o = vim.opt
        local m = vim.keymap.set

        o.title = true
        o.number = true
        o.relativenumber = true
        o.linebreak = true
        o.termguicolors = true
        o.autoindent = true
        o.smartindent = true
        o.breakindent = true
        o.copyindent = true
        o.expandtab = true
        o.undofile = true
        o.cindent = true
        o.smartcase = true
        o.ignorecase = true
        o.infercase = true
        o.showcmd = true
        o.cursorline = true
        o.signcolumn = "yes:1"
        o.clipboard = "unnamedplus"
        o.virtualedit = "block"
        o.shiftwidth = 2
        o.cmdheight = 0
        o.numberwidth = 1
        o.scrolloff = 5
        o.laststatus = 3
        o.pumheight = 10
        o.tabstop = 2
        o.list = true
        o.breakindentopt = { shift = 2, min = 4 }
        o.listchars = {
          eol = "¬",
          tab = "» ",
          trail = "~",
          extends = ">",
          precedes = "<"
        }

        vim.loader.enable()
        require('vim._core.ui2').enable()
        vim.g.mapleader = ' '

        m("n", "<TAB>", ":bn<CR>", { silent = true, noremap = true }) m("n", "<S-TAB>", ":bp<CR>", { silent = true, noremap = true })
        m("n", "<leader>/", ":nohl<CR>", { silent = true, noremap = true })
        m("n", "<leader>fg", function() Snacks.picker.grep() end)
        m("n", "<leader>ff", function() Snacks.picker.smart() end)
        m("n", "<leader>fd", function() Snacks.picker.zoxide() end)
        m("n", "<leader>fu", function() Snacks.picker.undo() end)
        m("n", "<C-A-w>", function() Snacks.bufdelete.invisible() end)
        m("n", "gq", function() require("conform").format() end, { silent = true, noremap = true })
        m("n", "<S-t>", function() Snacks.picker.buffers() end, { desc = "Buffers" })
        m("n", "<leader>fb", ":Fyler<CR>", { silent = true, noremap = true })
        m("n", "<leader>gb", "%", { silent = true, noremap = true })
        m("n", "<leader>t", "<CMD>Fyler kind=split_left_most<CR>", { silent = true, noremap = true })
        m('n', "<leader>gg", "<cmd>Neogit kind=floating<CR>", { silent = true, noremap = true })
        m('n', '<leader>r', ":%s/\\<<C-r><C-w>\\>//g<Left><Left>" )
        m("n", "<PageDown>", "<S-}>zz")
        m("n", "<PageUp>", "<S-{>zz")
        m("v", "<PageDown>", "<S-}>zz")
        m("v", "<PageUp>", "<S-{>zz")
        m("i", "<C-H>", "<C-w>", { silent = true, noremap = true })
        m({ "n", "v" }, "<leader>h", "^")
        m({ "n", "v" }, "<leader>l", "$")
        m("n", "<leader>cpf", function()
          local filePath = vim.fn.expand("%:~")
          vim.fn.setreg("+", filePath) 
          print ("File path copied to clipboard: " .. filePath)
        end)

        statusline = function()
          local modes = {
            ["n"]  = "NORMAL",
            ["no"] = "N-PENDING",
            ["v"]  = "VISUAL",
            ["V"]  = "V-LINE",
            ["\22"] = "V-BLOCK",
            ["s"]  = "SELECT",
            ["S"]  = "S-LINE",
            ["\19"] = "S-BLOCK",
            ["i"]  = "INSERT",
            ["ic"] = "INSERT",
            ["R"]  = "REPLACE",
            ["Rv"] = "V-REPLACE",
            ["c"]  = "COMMAND",
            ["cv"] = "VIM EX",
            ["ce"] = "EX",
            ["r"]  = "PROMPT",
            ["rm"] = "MORE",
            ["r?"] = "CONFIRM",
            ["!"]  = "SHELL",
            ["t"]  = "TERMINAL",
          }

          local m = modes[api.nvim_get_mode().mode] or "UNKNOWN"
          local sf = string.format

          local function get_git_branch()
            local branch = vim.b.gitsigns_head
            if branch and branch ~= "" then
              return "  " .. branch .. " "
            end
            return ""
          end

          return table.concat {
            sf("  %s ", m),
            sf(" %s ", vim.fn.pathshorten(vim.fn.expand("%f"), 3)),
            "%m",
            get_git_branch(),
            "%=",
            " %l:%c  ",
            " %P ",
          }
        end

        o.statusline = "%!v:lua.statusline()"

        local sev = vim.diagnostic.severity
        vim.diagnostic.config {
          signs = {
            text = {
              [sev.ERROR] = " ",
              [sev.WARN] = " ",
              [sev.INFO] = " ",
              [sev.HINT] = " "
            },

            linehl = {
              [sev.ERROR] = "DiagnosticLineError",
              [sev.WARN]  = "DiagnosticLineWarn",
              [sev.INFO]  = "DiagnosticLineInfo",
              [sev.HINT]  = "DiagnosticLineHint",
            },

            numhl = {
              [sev.ERROR] = "DiagnosticSignError",
              [sev.WARN]  = "DiagnosticSignWarn",
              [sev.INFO]  = "DiagnosticSignInfo",
              [sev.HINT]  = "DiagnosticSignHint",
            },
          },
        }

        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        o.rtp:prepend(lazypath)

        require("lazy").setup({
          performance = {
            reset_packpath = false,
          },

          spec = {
            { "nvim-tree/nvim-web-devicons"  },
            { "mrjones2014/smart-splits.nvim" },

            {
              "OXY2DEV/markview.nvim",
              lazy = false,
            },


            {
              "NeogitOrg/neogit",
              lazy = true,
              dependencies = {
                "esmuellert/codediff.nvim",
                "m00qek/baleia.nvim",
              },
              cmd = "Neogit",
            },

            {
              "folke/trouble.nvim",
              opts = {},
              cmd = "Trouble",
            },

            {
              'aveplen/ruscmd.nvim',
              event = "VeryLazy",
              opts = {},
            },

            {
              'danilamihailov/beacon.nvim',
              event = "VeryLazy",
              opts = {},
            },

            {
              "nvim-mini/mini.notify",
              event = "VeryLazy",
              opts = {
                window = {
                  config = function()
                    local has_statusline = vim.o.laststatus > 0
                    local pad = vim.o.cmdheight + (has_statusline and 2 or 0)
                    return {
                      anchor = 'SE',
                      col = vim.o.columns,
                      row = vim.o.lines - pad,
                      border = 'none',
                    }
                  end,
                  winblend = 95,
                },
              },
            },

            {
              "wurli/contextindent.nvim",
              event = "VeryLazy",
              opts = { pattern = "*" },
              dependencies = { "nvim-treesitter/nvim-treesitter" },
            },

            { 
              'glacambre/firenvim',
              build = ":call firenvim#install(0)",
              config = function()
                vim.g.firenvim_config = {
                  globalSettings = { alt = "all" },
                  localSettings = {
                    [".*"] = {
                      takeover = "never"
                    }
                  }
                }
              end,
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
              dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
              main = "nvim-treesitter.config",
              opts = {
                indent = { enable = true },
                highlight = {
                  enable = true,
                  additional_vim_regex_highlighting = false,
                },
                folds = { enable = true },
              },
            },

            {
              'm-demare/hlargs.nvim',
              event = 'VeryLazy',
              opts = {
                color = '#${base0C}',
              },
            },

            {
              'FylerOrg/fyler.nvim',
              lazy = false,
              opts = {
                integrations = {
                  icon = "nvim_web_devicons",
                },
              },
            },

            {
              'nvim-mini/mini.pairs',
              event = "VeryLazy",
              config = true
            },

            {
              'nvim-mini/mini.surround',
              event = "VeryLazy",
              config = true
            },

            {
              "folke/snacks.nvim",
              priority = 1000,
              lazy = false,
              opts = {
                indent = {
                  enabled = true,
                },

                dashboard = {
                  enabled = true,
                },

                picker = {
                  enabled = true,
                  layout = { preset = "telescope" },
                  sources = {
                    zoxide = { },
                  },
                },
              },
            },

            {
              "mikavilpas/yazi.nvim",
              lazy = true;
              opts = {},
            },

            {
              'norcalli/nvim-colorizer.lua',
              event = "VeryLazy",
              config = function()
                require"colorizer".setup()
              end,
            },

            {
              'saghen/blink.cmp',
              version = '1.*',
              dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
              opts = {
                keymap = {
                  preset = 'enter',
                  ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                  ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                  ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                  ['<C-e>'] = { 'hide', 'fallback' },
                  ['<CR>'] = { 'accept', 'fallback' },
                  ['<Tab>'] = { 'snippet_forward', 'fallback' },
                  ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                },

                completion = {
                  documentation = { auto_show = true, auto_show_delay_ms = 500 },
                  menu = {
                    draw = {
                      columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                      },
                    },
                  },
                },

                sources = {
                  default = { 'lsp', 'path', 'snippets', 'buffer' },
                },

                snippets = { preset = 'luasnip' },
              },
            },

            {
              "jmbuhr/otter.nvim",
              opts = {
                lsp = {
                  diagnostic_update_events = { "BufWritePost" },
                  root_dir = function(_, bufnr)
                    return vim.fs.root(bufnr or 0, {
                      ".git",
                      "_quarto.yml",
                      "package.json",
                    }) or vim.fn.getcwd(0)
                  end,
                },

                buffers = {
                  set_filetype = true,
                  write_to_disk = false,
                  preambles = {},
                  postambles = {},
                  ignore_pattern = {
                    python = "^(%s*[%%!].*)",
                  },
                },

                handle_leading_whitespace = true,
                extensions = {},
                debug = false,
                verbose = {
                  no_code_found = false,
                },
              },

              config = function(_, opts)
                require("otter").setup(opts)

                vim.api.nvim_create_autocmd("FileType", {
                  pattern = { "nix", "markdown" },
                  callback = function()
                    require("otter").activate()
                  end,
                })
              end,
            },

            {
              'neovim/nvim-lspconfig',
              event = { "BufReadPre", "BufNewFile" },
              config = function()
                local enable = vim.lsp.enable

                local flake_path = "$XDG_CONFIG_HOME/nixos-touka/"

                enable('nixd', {
                  cmd = { "nixd" },
                  filetypes = { "nix" },
                  root_markers = { "flake.nix", ".git" },
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
                          expr = string.format('(builtins.getFlake ("git+file://%s")).nixosConfigurations.think.options', flake_path),
                        },

                        home_manager = {
                          expr = string.format('(builtins.getFlake ("git+file://%s")).homeConfigurations.hezaki.options', flake_path),
                        },
                      },
                    },
                  },
                })

                enable('lua_ls', {
                  capabilities = capabilities,
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
                })
              end
            },

            {
              'stevearc/conform.nvim',
              event = 'VeryLazy',
              opts = {
                formatters_by_ft = {
                  nix = { "nixfmt" },
                  lua = { "stylua" },
                  html = { "prettierd" },
                  css = { "prettierd" },
                  javascript = { "prettierd" },
                  json = { "prettierd" },
                  go = { "gofmt" },
                },
              },
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
                  indentblankline = true,
                  notify = true,
                  ts_rainbow = true,
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
          hi WinSeparator guifg=#${base03}
          hi LineNr guifg=#${base03}
          hi CodeBlock guibg=#${base00}
          hi Dash guibg=#${base00} gui=bold
          hi ZenBg guibg=#${base00}

          hi FloatBorder guifg=#${base03}
          hi NeogitFloatBorder guifg=#${base03}
          hi IndentLine guifg=#${base03}
          hi IndentLineCurrent guifg=#${base04}
        ]])
      '';
  };
}
