-- return {}
-- https://github.com/nvim-neotest/neotest
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim", "marilari88/neotest-vitest"
    },
    event = "VeryLazy",
    config = function()
        --[[  local is_npm_package_installed =
            require('utils').is_npm_package_installed
 ]]
        local neotest = require('neotest')
        local bind = vim.keymap.set
        local adapters = {}

        --[[  if is_npm_package_installed 'vitest' then
            table.insert(adapters, require('neotest-vitest') {
                vitestCommand = 'npm run test --',
                env = {CI = true}
            })
        end ]]

        table.insert(adapters, require('neotest-vitest') {
            vitestCommand = 'npm run test --',
            env = {CI = true}
        })

        neotest.setup({
            adapters = adapters,
            output = {enabled = true, open_on_run = true}
        })

        bind('n', '<leader>tn', function() neotest.run.run() end,
             {desc = 'Neotest - N'})

        bind('n', '<leader>tf',
             function() neotest.run.run(vim.fn.expand '%') end,
             {desc = 'Test file'})
        bind('n', '<leader>ta',
             function() neotest.run.run(vim.fn.expand '%') end,
             {desc = 'Neotest - Test all'})
        bind('n', '<leader>tl', function() neotest.run.run_last() end,
             {desc = 'Neotest - Test last'})
        bind('n', '<leader>ts', function() neotest.summary.toggle() end,
             {desc = 'Neotest - Test summary'})
    end
}

