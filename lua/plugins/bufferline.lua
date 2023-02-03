return {
	"akinsho/bufferline.nvim",
	dependencies = "catppuccin",
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ""
				end

				return ""
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
}
