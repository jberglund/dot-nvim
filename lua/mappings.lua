local map = vim.keymap.set
local default_options = { noremap = true }

-- map the leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "


map('n', '<leader><esc>', ':nohlsearch<cr>', options)
-- map('n', '<leader>n', ':bnext<cr>', options)
-- map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<leader>q', ':q!<cr>', options)
map('n', '<leader>w', ':w!<cr>', options)

-- better indenting
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)
map("n", ">", ">>", options)
map("n", "<", "<<", options)

map("i", "jk", "<Esc>", options)

map('n', '<leader>ev', ':source ~/.config/nvim/init.lua', options)
map('n', '<leader>el', ':luafile %<cr>', options)
