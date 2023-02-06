local conditions = require("heirline.conditions")

local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	hl = { fg = "orange" },

	{ -- git branch name
		provider = " ",
		hl = { bold = true },
	},
	{ -- git branch name
		provider = function(self)
			return self.status_dict.head
		end,
		hl = { fg = "overlay2", bold = true },
	},
}

return Git
