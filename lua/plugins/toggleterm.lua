-- https://github.com/akinsho/toggleterm.nvim
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>Tt", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
	},
	cmd = "ToggleTerm",
	config = function()
		require("toggleterm").setup({
			-- direction = "float",
			-- float_opts = {
			-- 	border = "single",
			-- 	width = 100,
			-- 	height = 30,
			-- },
		})
	end,
}
