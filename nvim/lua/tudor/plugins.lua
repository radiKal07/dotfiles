local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  print("Installing packer close and reopen Neovim...")
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim'  -- Useful lua functions used by lots of plugins

  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c_sharp', 'dart' },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
        },
      }
    end
  }

  -- Mason for installing LSPs etc
  use 'mason-org/mason.nvim'

  -- Highlight current scope
  use 'lukas-reineke/indent-blankline.nvim'

  -- theme
  use 'yorumicolors/yorumi.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- dim inactive windows
  -- TODO: last update causes issues, look into re-enabling later
  -- use 'sunjon/shade.nvim'

  -- Tree folder structure
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end,
  }

  -- nice icons in folder tree
  use 'kyazdani42/nvim-web-devicons'

  -- nice icons in Autocomplete
  use 'onsails/lspkind.nvim'

  -- tab bars
  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- better scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = { '<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
      })
    end
  }

  -- status bar
  use 'feline-nvim/feline.nvim'

  -- shows code context in winbar
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup({
        symbols = {
          separator = ">"
        },
        kinds = false
      })
    end,
  })

  -- Telescope plugin: popup window with actions
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-dap.nvim' }

  -- LSP plugins
  use 'neovim/nvim-lspconfig' -- LSP configs
  use 'hrsh7th/nvim-cmp'      -- Autocomplete engine
  use 'hrsh7th/cmp-nvim-lsp'  -- LSP source for nvim-cmp

  -- Debug
  use 'mfussenegger/nvim-dap'
  -- Debug UI
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } }

  -- C#
  use 'seblj/roslyn.nvim'

  -- Dart
  use 'dart-lang/dart-vim-plugin'

  -- Flutter
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Linter
  use {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_sign_error = '✘'
      vim.g.ale_sign_warning = '⚠'
      vim.g.ale_sign_info = '·'
      vim.g.ale_sign_style_error = '·'
      vim.g.ale_sign_style_warning = '·'
      vim.g.ale_linters = { ['cs'] = { 'OmniSharp' } }
    end
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
