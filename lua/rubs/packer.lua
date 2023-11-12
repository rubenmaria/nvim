-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- theme
    use {
      "ellisonleao/gruvbox.nvim",
      as = 'gruvbox',
      config = function()
          vim.cmd('colorscheme gruvbox')
          end
    }

    use { 'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' }

    use 'ThePrimeagen/harpoon'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use 'lervag/vimtex'

    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
    }

    -- whichkey
    use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {}
      end
    }

    -- jupyter
    use { "kiyoon/jupynium.nvim", run = "pip3 install --user ." }
    use { "rcarriga/nvim-notify" }
    use { "stevearc/dressing.nvim" }
end)
