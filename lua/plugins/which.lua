local default_options = {silent = true, prefix = "<leader>"}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {plugins = {spelling = true}},
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            mode = {"n", "v"},
            ["g"] = {name = "+ goto"},
            ["gz"] = {name = "+ surround"},
            ["]"] = {name = "+ next"},
            ["["] = {name = "+ prev"},
            ["<leader><tab>"] = {name = "+ tabs"},
            ["<leader>b"] = {name = "+ buffer"},
            ["<leader>c"] = {name = "+ code"},
            ["<leader>f"] = {name = "+ file/find"},
            ["<leader>g"] = {name = "+ git"},
            ["<leader>gh"] = {name = "+ hunks"},
            ["<leader>q"] = {name = "+ quit/session"},
            ["<leader>s"] = {name = "+ search"},
            ["<leader>t"] = {name = "+ test"},
            -- ["<leader>sn"] = {name = "+ noice"},
            ["<leader>u"] = {name = "+ ui"},
            ["<leader>w"] = {name = "+ windows"},
            ["<leader>x"] = {name = "+ diagnostics/quickfix"}
        })
        --[[ wk.register({
            ["<Tab>"] = {"<cmd>e#<cr>", "Prev buffer"},
            f = {
                name = "Files", -- optional group name
                f = {"<cmd>Telescope find_files<cr>", "Find File"},
                g = {"<cmd>Telescope live_grep<cr>", "Grep in files"},
                b = {"<cmd>Telescope buffers<cr>", "Buffers"},
                B = {
                    "<cmd>Telescope file_browser grouped=true<cr>",
                    "File browser"
                },
                e = {"<cmd>Neotree toggle<cr>", "Toggle Explorer"},
                o = {"<cmd>Neotree focus<cr>", "Focus Explorer"},
                r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"}
            },
            c = {
                name = "Code",
                a = {"<cmd>Lspsaga code_action<CR>", "Code Actions"},
                l = {
                    "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics"
                },
                d = {"<cmd>Lspsaga peek_definition<CR>", "Peek Definition"},
                r = {"<cmd>Lspsaga lsp_finder<CR>", "Go to Reference"},
                R = {"<cmd>Lspsaga rename<CR>", "Rename"}
            }
        }, default_options) ]]
    end
}
