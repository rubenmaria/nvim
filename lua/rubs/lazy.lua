local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
      'nvim-telescope/telescope.nvim', version = '0.1.2',
      dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
      "ellisonleao/gruvbox.nvim",
      name = 'gruvbox',
      config = function()
          vim.cmd('colorscheme gruvbox')
          end
    },
    { 'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
    {'ThePrimeagen/harpoon'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {'lervag/vimtex'},
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
    },
    {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {}
      end
    },
    { "rcarriga/nvim-notify" },
    { "stevearc/dressing.nvim"},
}

local opts = {}

require("lazy").setup(plugins, opts)
