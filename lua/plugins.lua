-- local settings = require("user-conf")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use

packer.reset()


-- actual plugins list
use { "wbthomason/packer.nvim" }

-- Speed up loading Lua modules in Neovim to improve startup time.
use { 'lewis6991/impatient.nvim' }

-- move icons to top and use {after = "nvim-web-devicons",}

use {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = get_config("treesitter"),
}

use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = { 
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = get_config('neotree')
}

use {
  "glepnir/lspsaga.nvim",
  branch = "version_2.2",
  config = get_config("lspsaga")
}

use {"folke/which-key.nvim", config = get_config("which")}

use {"folke/tokyonight.nvim", config = get_config("tokyonight")}
-- use {"EdenEast/nightfox.nvim", config = get_config("nightfox")}
-- use {"sam4llis/nvim-tundra", config = get_config("tundra")}

use {
  'lewis6991/gitsigns.nvim',
  config = get_config('gitsigns'),
  event = "BufEnter",
}

-- use {
--   "feline-nvim/feline.nvim", 
--   requires = {
--     'lewis6991/gitsigns.nvim',
--     'kyazdani42/nvim-web-devicons',
--     -- for creating a theme
--     'folke/tokyonight.nvim',
--   },
--   config = get_config("feline"),
-- }
use {
  'windwp/nvim-autopairs',
  config = get_config("autopairs"),
}

use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

use {
  'neovim/nvim-lspconfig',
  config = get_config("lspconfig"),
}

use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("cmp"),
  }

use({ "tpope/vim-fugitive" })

use {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = get_config('alpha')
}

use {
  'akinsho/bufferline.nvim', tag = "v2.*", 
  requires = {'kyazdani42/nvim-web-devicons'},
  config = get_config('bufferline')
}

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = get_config('telescope')
}

use {
  'numToStr/Comment.nvim',
  config = get_config('comment')
}

use {
  'JoosepAlviste/nvim-ts-context-commentstring',
  after = 'nvim-treesitter',
  config = get_config('comment')
}

