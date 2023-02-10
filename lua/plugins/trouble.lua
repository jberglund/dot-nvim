local icon = require("config.icons").diagnostics
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
		padding = false,
		signs = {
			error = icon.Error,
			warning = icon.Warn,
			hint = icon.Hint,
			information = icon.Info,
			other = "﫠",
		},
	},
}
