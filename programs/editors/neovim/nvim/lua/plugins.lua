local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.indent_blankline')
      end
    }

    -- ui
    use {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup()
      end
    }
    use 'rrethy/nvim-base16'
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = { 'nathom/filetype.nvim' },
      config = function()
        require('plugins.treesitter')
      end
    }
    use {"akinsho/toggleterm.nvim", tag = '*',
      config = function()
        require("toggleterm").setup()
      end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.nvim-tree')
      end
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('plugins.gitsigns')
      end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('plugins.telescope')
      end
    }
    use {
      'akinsho/bufferline.nvim',
      config = function()
        require('plugins.bufferline')
      end
    }

    -- completion, lsp
    use {
      'yamatsum/nvim-cursorline',
      config = function()
        require('plugins.nvim-cursorline')
      end
    }
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('plugins.nvim-lspconfig')
      end
    }
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline'},
      config = function()
        require('plugins.cmp')
      end
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    if packer_bootstrap then
      require('packer').sync()
    end

  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    }
  }
}
