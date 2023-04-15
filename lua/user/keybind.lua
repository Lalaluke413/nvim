
-- setup vim keybindings
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open file manager

keymap.set("n", "<C-h>", "<Nop>")

-- remove highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
