local fn = vim.fn
local cmd = vim.cmd

-- Automatically install packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer itself

  -- Navigation
  -------------

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('plugins.telescope').load_extension('projects') end,
    requires = {
      'nvim-lua/plenary.nvim',  -- Useful Lua utilities
      'nvim-lua/popup.nvim',

      -- FZF sorter for Telescope
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    },
  }

  use 'ggandor/lightspeed.nvim'

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Looks
  --------

  -- Colorscheme
  use {
    'arcticicestudio/nord-vim',
    config = function()
      require('plugins.colorscheme').setup()
    end
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    config = function() require('plugins.statusline') end,
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require("gitsigns").setup {} end,
  }

  -- Programming
  --------------

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end,
    requires = {
      'windwp/nvim-ts-autotag',  -- Automatically end & rename tags
      -- Dynamically set commentstring based on cursor location in file
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground',
    },
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function() require('lsp') end,
    requires = {
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      'jose-elias-alvarez/null-ls.nvim',
      'nvim-lua/plenary.nvim',
      'max397574/lua-dev.nvim',
      'b0o/schemastore.nvim',
    }
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim'
    }
  }

    -- Miscellaneous
    ----------------

    use 'mhinz/vim-startify'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use {
      'vim-scripts/ReplaceWithRegister',
    }
    use 'tpope/vim-fugitive'
    use 'yazgoo/yank-history'
    use "b0o/mapx.nvim"
    use { 
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end,
    }
    use { 
      'windwp/nvim-autopairs',
      -- config = function() require('nvim-autopairs').setup() end,
    }
  -- use {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
    use {
      'rmagatti/goto-preview',
      -- config = function()
      --   require('plugins/goto-preview').setup {}
      -- end
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
