local status, tokyonight = pcall(require, "tokyonight")
if (not status) then return end

tokyonight.setup({
  style = "moon",
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "terminal", "packer" },
})


 -- setup must be called before loading
vim.cmd("colorscheme tokyonight")

