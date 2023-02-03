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
	},
	opts = {
		position = "right",
	},
}
