-- https://github.com/akinsho/toggleterm.nvim
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	keys = {
		{ "<c-/>", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
	},
	config = function()
		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "single",
			},
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
				-- Normal = {
				-- 	guibg = "<VALUE-HERE>",
				-- },
				-- NormalFloat = {
				-- 	link = "Normal",
				-- },
				FloatBorder = {
					guifg = "green",
					guibg = "green",
				},
			},
		})
	end,
}
