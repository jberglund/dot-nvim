return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            diagnostics_indicator = function(count, level, diagnostics_dict,
                                             context)
                if context.buffer:current() then return '' end

                return ''
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left"
                }
            }
        }
    }
}
