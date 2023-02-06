return {
	"akinsho/bufferline.nvim",
	dependencies = "catppuccin/nvim",
	event = "VeryLazy",
	opts = {
		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ""
				end

				local icon = level:match("error") and " " or " "
				return " " .. icon .. count

				-- return require("config.icons").icons.diagnostics.Error
			end,
			custom_areas = {
				right = function()
					local result = {}
					local seve = vim.diagnostic.severity
					local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
					local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
					local info = #vim.diagnostic.get(0, { severity = seve.INFO })
					local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

					if error ~= 0 then
						table.insert(result, { text = "  " .. error, fg = "#EC5241" })
					end

					if warning ~= 0 then
						table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
					end

					if hint ~= 0 then
						table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
					end

					if info ~= 0 then
						table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
					end
					return result
				end,
			},

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
	-- config = function(plugin, opts)
	-- 	require("bufferline").setup({})
	-- end,
}
