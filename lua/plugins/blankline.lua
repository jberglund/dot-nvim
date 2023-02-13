return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	opts = {
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
		},
		show_trailing_blankline_indent = false,
		space_char_blankline = " ",
		show_current_context = true,
		-- show_current_context_start = true,
	},
	config = function(_, opts)
		vim.opt.list = true
		require("indent_blankline").setup(opts)
	end,
}
