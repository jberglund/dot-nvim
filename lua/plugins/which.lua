return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		window = {
			border = "none", -- none, single, double, shadow
			margin = { 3, 10, 4, 10 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 5, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "-", -- symbol used between a key and it's label
			group = "... ", -- symbol prepended to a group
		},
		key_labels = {
			["<space>"] = "Space",
			["<cr>"] = "Return",
			["<tab>"] = "Tab",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register({
			mode = { "n", "v" },
			["g"] = { name = "Goto" },
			-- ["gz"] = { name = "+ surround" },
			["]"] = { name = "Next" },
			["["] = { name = "Prev" },
			["<leader>c"] = { name = "Code" },
			["<leader>f"] = { name = "File/Find" },
			["<leader>g"] = { name = "Git" },
			["<leader>q"] = { name = "Session" },
			["<leader>s"] = { name = "Search" },
			["<leader>t"] = { name = "Test" },
			["<leader>w"] = { name = "Write" },
			-- ["<leader>u"] = { name = "-- unused" },
			-- ["<leader>x"] = { name = "-- unused" },
			-- ["<leader>b"] = { name = "-- unused" },
			-- ["<leader><tab>"] = { name = "-- unused" },
		})
	end,
}
