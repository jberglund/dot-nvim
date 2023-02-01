return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
    require('lualine').setup({
    options = {
        theme = "catppuccin"
    }
    })
  end
}
