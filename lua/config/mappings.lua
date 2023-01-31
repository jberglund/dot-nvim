local map = vim.keymap.set
local default_options = {noremap = true}

-- map the leader key
map({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.g.mapleader = " "

map('n', '<leader><esc>', ':nohlsearch<cr>', options)

map('n', '<leader>qq', ':Bdelete<cr>', {desc = 'Buffer Delete'}) -- using bufdelete.nvim in ui.lua
map('n', '<leader>qa', ":qa!<cr>", {desc = 'Quit all'})
-- bufffers
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {desc = "Next buffer"})
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {desc = "Prev buffer"})
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {desc = "Prev buffer"})
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {desc = "Next buffer"})

map('n', '<leader>w', ':w!<cr>', options)

-- better indenting
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)
map("n", ">", ">>", options)
map("n", "<", "<<", options)

map("n", "<A-j>", ":m .+1<cr>==", {desc = "Move down"})
map("v", "<A-j>", ":m '>+1<cr>gv=gv", {desc = "Move down"})
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", {desc = "Move down"})
map("n", "<A-k>", ":m .-2<cr>==", {desc = "Move up"})
map("v", "<A-k>", ":m '<-2<cr>gv=gv", {desc = "Move up"})
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", {desc = "Move up"})

map("i", "jk", "<Esc>", options)

-- git-- lazygit
--[[ map("n", "<leader>gg",
    function() Util.float_term({"lazygit"}, {cwd = Util.get_root()}) end,
    {desc = "Lazygit (root dir)"})
map("n", "<leader>gG", function() Util.float_term({"lazygit"}) end,
    {desc = "Lazygit (cwd)"}) ]]

-- windows
map("n", "<C-h>", "<C-w>h", {desc = "Go to left window"})
map("n", "<C-j>", "<C-w>j", {desc = "Go to lower window"})
map("n", "<C-k>", "<C-w>k", {desc = "Go to upper window"})
map("n", "<C-l>", "<C-w>l", {desc = "Go to right window"})

map('n', '<leader>ev', ':source ~/.config/nvim/init.lua', options)
map('n', '<leader>el', ':luafile %<cr>', options)

map("n", "<C-Up>", "<cmd>resize +2<cr>", {desc = "Increase window height"})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {desc = "Decrease window height"})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>",
    {desc = "Decrease window width"})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>",
    {desc = "Increase window width"})
