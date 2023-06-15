local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

opt.rtp:prepend(lazypath)
g.mapleader = " "

require('lazy').setup({
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent_blankline')
    end
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require('plugins.neorg')
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nathom/filetype.nvim' },
    config = function()
      require('plugins.treesitter')
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.gitsigns')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope')
    end
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.bufferline')
    end
  },
  {
    'yamatsum/nvim-cursorline',
    config = function()
      require('plugins.nvim-cursorline')
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline'},
    config = function()
      require('plugins.cmp')
    end
  },
  {
    'williamboman/mason.nvim',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require("plugins.lsp")
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
    'rrethy/nvim-base16'
})

