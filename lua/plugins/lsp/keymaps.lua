local M = {}

M._keys = nil

function M.get()
	local format = require("plugins.lsp.format").format
  -- stylua: ignore
  M._keys = M._keys or {
    { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show line diagnostic" },
    -- { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
    { "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peak Definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
    -- { "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
    { "gt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peak Type Definition" },
    { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP Finder" },
    { "ga", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
    { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover" },
    -- { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
    { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
    { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
    { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
    { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
    { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
    -- { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
    { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
    { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
    { "<leader>cr", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename in project"},
    -- { "<leader>cr", M.rename, expr = true, desc = "Rename", has = "rename" },
  }
	return M._keys
end

function M.on_attach(client, buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = {}

	for _, value in ipairs(M.get()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
			local opts = Keys.opts(keys)
			opts.has = nil
			opts.silent = true
			opts.buffer = buffer
			vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
		end
	end
end

function M.rename()
	if pcall(require, "inc_rename") then
		return ":IncRename " .. vim.fn.expand("<cword>")
	else
		vim.lsp.buf.rename()
	end
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

return M
