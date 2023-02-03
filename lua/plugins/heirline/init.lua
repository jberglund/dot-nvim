return {
	"rebelot/heirline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"neovim/nvim-lspconfig",
		"catppuccin/nvim",
	},
	event = "UIEnter",
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")

		local colors = require("catppuccin.palettes").get_palette()

		heirline.load_colors(colors)

		-- local FileNameBlock = require("plugins.heirline.files")
		-- local ViMode = require("plugins.heirline.mode")
		local Git = require("plugins.heirline.git")
		local Diagnostics = require("plugins.heirline.diagnostics")

		local Align = { provider = "%=" }
		local Space = { provider = " " }

		local StatusLine = {
			-- ViMode,
			Space,
			Git,
			Space,
			Diagnostics,
			Space,
			-- FileNameBlock,
			Align,
		}

		-- require("heirline").load_colors(colors)
		require("heirline").setup({
			statusline = StatusLine,
			-- winbar = WinBar,
			-- tabline = TabLine,
			-- statuscolumn = StatusColumn,
		})
	end,
}
