vim.g.mapleader = " "

local map = vim.keymap.set

map("i", "jj", "<Esc>", { silent = true })

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<C-a>", "ggVG")

map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
