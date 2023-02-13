return {
	"akinsho/bufferline.nvim",
	version = "v3.*",
	dependencies = "catppuccin/nvim",
	event = "VeryLazy",
	opts = {
		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
		-- highlights = {
		-- 	-- fill = {
		-- 	-- 	bg = "red",
		-- 	-- 	fg = "red",
		-- 	-- },
		-- 	-- background = {
		-- 	-- 	bg = "green",
		-- 	-- 	fg = "green",
		-- 	-- },
		-- },
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, _, context)
				-- if context.buffer:current() then
				-- 	return ""
				-- end
				local icons = require("config.icons").diagnostics

				local icon = level:match("error") and icons.Error or icons.Warn
				return " " .. icon .. count
			end,
			-- this puts diagnostics in the bufferline:
			-- custom_areas = {
			-- 	right = function()
			-- 		local result = {}
			-- 		local seve = vim.diagnostic.severity
			-- 		local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
			-- 		local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
			-- 		local info = #vim.diagnostic.get(0, { severity = seve.INFO })
			-- 		local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
			--
			-- 		if error ~= 0 then
			-- 			table.insert(result, { text = "  " .. error, fg = "#EC5241" })
			-- 		end
			--
			-- 		if warning ~= 0 then
			-- 			table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
			-- 		end
			--
			-- 		if hint ~= 0 then
			-- 			table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
			-- 		end
			--
			-- 		if info ~= 0 then
			-- 			table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
			-- 		end
			-- 		return result
			-- 	end,
			-- },

			offsets = {
				{
					filetype = "neo-tree",
					text = "~ explorer",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "Trouble",
					text = "~ diagnostics",
					highlight = "Directory",
					text_align = "left",
				},
			},
			indicator = {
				style = "icon",
			},
			show_buffer_close_icons = false,
			show_close_icon = false,
			always_show_bufferline = false,
			separator_style = "thin",
			-- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
		},
	},
	config = true,
	-- config = function(_, opts)
	-- 	require("bufferline").setup({
	-- 		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	-- 		options = opts.options,
	-- 	})
	-- end,
}
