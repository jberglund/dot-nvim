local conditions = require("heirline.conditions")
local icons = require("config.icons").icons

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
		warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
		info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
		hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
	},
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and self.error_icon
		end,
		hl = { fg = "red" },
	},
	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and self.errors
		end,
		hl = { fg = "text" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and self.warn_icon
		end,
		hl = { fg = "yellow" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and self.warnings
		end,
		hl = { fg = "text" },
	},
}

return Diagnostics
