-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>fe", "<cmd>Neotree float<cr>", desc = "Explorer - from root" },
		{
			"<leader>fE",
			"<cmd>Neotree float reveal<cr>",
			desc = "Explorer - reveal current file",
		},
		{
			"<leader>fT",
			"<cmd>NeoTree focus toggle reveal<cr>",
			desc = "Explorer - Toggle",
		},
		{
			"<leader>ft",
			"<cmd>Neotree focus reveal<cr>",
			desc = "Explorer - Focus",
		},
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			window = { position = "left" },
		})
	end,
}
