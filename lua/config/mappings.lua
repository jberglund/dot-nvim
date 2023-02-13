local map = vim.keymap.set
-- local default_options = { noremap = true }

-- map the leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

map("n", "<leader><esc>", ":nohlsearch<cr>")

map("n", "<leader>qb", ":Bdelete<cr>", { desc = ":bd Buffer Belete" }) -- using bufdelete.nvim in ui.lua
map("n", "<leader>qq", ":q<cr>", { desc = ":q Quit" }) -- using bufdelete.nvim in ui.lua
map("n", "<leader>qQ", ":q!<cr>", { desc = ":q! Quit, force" }) -- using bufdelete.nvim in ui.lua
map("n", "<leader>qa", ":qa<cr>", { desc = ":qa Quit all" })
map("n", "<leader>qA", ":qa!<cr>", { desc = ":qa! Quit all, force" })
map("n", "Q", ":q<cr>", { desc = "Quit" })
map("n", "q", ":Bdelete<cr>", { desc = "Buffer delete" })

-- bufffers
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

map("n", "<leader>w", ":silent write<cr>", { desc = "Save, silently!", silent = true })

-- better indenting
map("v", "<", "<gv", { desc = "Indent line left" })
map("v", ">", ">gv", { desc = "Indent line right" })

map("n", "<", "<<", { desc = "Indent line left" })
map("n", ">", ">>", { desc = "Indent line right" })

map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
