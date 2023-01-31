return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    keys = {
        {
            "<leader>,",
            "<cmd>Telescope buffers show_all_buffers=true<cr>",
            desc = "Switch Buffer"
        },
        {
            "<leader>/",
            "<cmd>Telescope live_grep<cr>",
            desc = "Find in Files (Grep)"
        },
        {
            "<leader>:",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History"
        }, {
            "<leader><space>",
            "<cmd>Telescope find_files<cr>",
            desc = "Find Files (root dir)"
        }, -- find
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers"},
        {
            "<leader>fg",
            "<cmd>Telescope git_files<cr>",
            desc = "Find Files (git)"
        },
        {
            "<leader>ff",
            "<cmd>Telescope find_files<cr>",
            desc = "Find Files (cwd)"
        }, {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent"},
        -- git
        {"<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits"},
        {"<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status"},
        -- search
        {
            "<leader>sa",
            "<cmd>Telescope autocommands<cr>",
            desc = "Auto Commands"
        },
        {
            "<leader>sb",
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            desc = "Buffer"
        },
        {
            "<leader>sc",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History"
        }, {"<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands"},
        {"<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics"},
        {"<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)"},
        {"<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages"}, {
            "<leader>sH",
            "<cmd>Telescope highlights<cr>",
            desc = "Search Highlight Groups"
        }, {"<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps"},
        {"<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages"},
        {"<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark"},
        {"<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options"},
        {
            "<leader>sw",
            "<cmd>Telescope grep_string<cr>",
            desc = "Word (root dir)"
        }
    },
    opts = {
        defaults = {prompt_prefix = " ", selection_caret = " "},
        pickers = {find_files = {theme = "dropdown"}}
    }
}
