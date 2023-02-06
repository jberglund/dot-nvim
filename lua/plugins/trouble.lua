return {
	"folke/trouble.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	-- cond = maybe add has_diagnostics
	keys = {
		{
			"<leader>cT",
			"<cmd>TroubleToggle<cr>",
			desc = "Trouble Toggle",
		},
		{
			"<leader>ct",
			"<cmd>Trouble<cr>",
			desc = "Trouble",
		},
	},
	opts = {
		position = "right",
	},
}
