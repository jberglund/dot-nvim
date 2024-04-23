return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>gb",
			"<cmd>Gitsigns toggle_current_line_blame",
			desc = "Current Line Blame",
		},
	},
	config = true,
}
