if true then
	return {}
end
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		local icons = require("config.icons").icons
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = { left = "", right = "" },
				section_separators = { left = icons.statusline.right_rounded, right = icons.statusline.left_rounded },
			},
			sections = {
				lualine_c = {},
			},
		})
	end,
}
