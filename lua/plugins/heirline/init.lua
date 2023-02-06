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
		local Lsp = require("plugins.heirline.lsp")

		local WorkDir = {
			provider = function()
				local icon = " "
				local cwd = vim.fn.getcwd(0)
				cwd = vim.fn.fnamemodify(cwd, ":~")
				if not conditions.width_percent_below(#cwd, 0.25) then
					cwd = vim.fn.pathshorten(cwd)
				end
				local trail = cwd:sub(-1) == "/" and "" or "/"
				return icon .. cwd .. trail
			end,
			hl = { fg = "blue" },
		}

		local Align = { provider = "%=" }
		local Space = { provider = "  " }

		local StatusLine = {
			-- ViMode,
			Space,
			WorkDir,
			Space,
			Git,
			Space,
			Diagnostics,
			Space,
			-- FileNameBlock,
			Align,
			Lsp,
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
