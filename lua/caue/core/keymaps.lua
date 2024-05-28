vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for brevity

keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Use ctrl+s to save and exit insert mode" })
keymap.set("n", "<C-s>", "<ESC>:w<CR>", { desc = "Use ctrl+s to save" })

keymap.set("n", "<CR>", ":nohl<CR>", { desc = "Clear search highlight on enter"})
