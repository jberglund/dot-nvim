return {
	-- { "nyoom-engineering/oxocarbon.nvim", lazy = false },
	-- {
	-- 	"rktjmp/lush.nvim",
	-- 	cmd = "LushRunQuickstart",
	-- },
	-- {
	-- 	"arturgoms/moonbow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme moonbow]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
			require("catppuccin").setup({
				flavour = "mocha",
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {
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
		},
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
