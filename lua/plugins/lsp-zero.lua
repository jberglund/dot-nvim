-- https://github.com/VonHeikemen/lsp-zero.nvim
-- https://github.com/lukas-reineke/lsp-format.nvim
-- https://github.com/glepnir/lspsaga.nvim
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'}, -- Required
        {'jose-elias-alvarez/null-ls.nvim'}, -- Optional
        {'williamboman/mason.nvim'}, -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        {'hrsh7th/nvim-cmp'}, -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-buffer'}, -- Optional
        {'hrsh7th/cmp-path'}, -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'}, -- Optional
        -- Snippets
        {'L3MON4D3/LuaSnip'} -- Required
        -- {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')

        lsp.set_preferences({set_lsp_keymaps = false})

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            local bind = vim.keymap.set
            bind('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {desc = 'Hover'})
            bind('n', '<leader>cR', '<cmd>lua vim.lsp.buf.rename()<cr>',
                 {desc = 'Rename'})
            bind('n', '<leader>cr', '<cmd>Telescope lsp_references<cr>',
                 {desc = 'Reference'})
            bind('n', '<leader>cl', '<cmd>lua vim.diagnostic.open_float()<cr>',
                 {desc = 'Diagnostics'})
            bind('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<cr>',
                 {desc = 'Definition'})
            bind('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
                 {desc = 'Declaration'})
            bind('n', '<leader>ct', "<cmd>Telescope lsp_type_definitions<cr>",
                 {desc = 'Type Definitions'})

            -- disable tsserver formatting in favour of null-ls
            if client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentFormattingRangeProvider =
                    false
            end
        end)

        lsp.setup()
        -- null-ls auto-formatting
        -- maybe look at https://github.com/LazyVim/LazyVim/blob/40d363cf3f468a1cc4ea482eaabbd5c7e224f397/lua/lazyvim/plugins/lsp/format.lua
        local null_ls = require('null-ls')
        local null_opts = lsp.build_options('null-ls', {
          on_attach = function(client, buf)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("LspFormat." .. buf,
                                                            {}),
                        buffer = buf,
                        desc = "Auto format before save",
                        callback = vim.lsp.buf.formatting_sync
                    })
                end
            end
        })

        null_ls.setup({
            on_attach = null_opts.on_attach,
            sources = {
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.eslint_d
            }
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = false,
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = ''
            }
        })
    end
}
