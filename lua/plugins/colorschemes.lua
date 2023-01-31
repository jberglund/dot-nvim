return {
    {'nyoom-engineering/oxocarbon.nvim', lazy = false}, -- tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {
            style = "moon",
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = {italic = true},
                keywords = {italic = true},
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark" -- style for floating windows
            }
        },
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end
    }, {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function() require'nordic'.load() end
    }
}
