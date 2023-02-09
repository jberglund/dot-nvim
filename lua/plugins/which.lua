return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = { plugins = { spelling = true } },
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register({
			mode = { "n", "v" },
			["g"] = { name = "+ goto" },
			-- ["gz"] = { name = "+ surround" },
			["]"] = { name = "+ next" },
			["["] = { name = "+ prev" },
			["<leader>c"] = { name = "+ code" },
			["<leader>f"] = { name = "+ file/find" },
			["<leader>g"] = { name = "+ git" },
			["<leader>q"] = { name = "+ quit/session" },
			["<leader>s"] = { name = "+ search" },
			["<leader>t"] = { name = "+ test" },
			["<leader>w"] = { name = "write" },
			["<leader>u"] = { name = "-- unused" },
			["<leader>x"] = { name = "-- unused" },
			["<leader>b"] = { name = "-- unused" },
			["<leader><tab>"] = { name = "-- unused" },
		})
	end,
}
