require("which-key").setup({})

local wk = require("which-key")
local default_options = { silent = true, prefix = "<leader>" }



wk.register({
      ["<Tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
    f = {
        name = "Files", -- optional group name
        b = { "<cmd>Telescope file_browser grouped=true<cr>", "File browser" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        e = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
        o = { "<cmd>Neotree focus<cr>", "Focus Explorer" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
    c = {
        name = "Code",
        a = {"<cmd>Lspsaga code_action<CR>", "Code Actions"},
        d = {"<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics"},
        d = {"<cmd>Lspsaga peek_definition<CR>", "Peek Definition"},
        r = {"<cmd>Lspsaga lsp_finder<CR>", "Go to Reference"},
        R = {"<cmd>Lspsaga rename<CR>", "Rename"},
    },
  }, default_options)
