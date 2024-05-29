local ui_utils = require("caue.util.ui")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for brevity

-----------------
-- Normal Mode --
-----------------
-- Better window navigation
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
keymap.set("n", "<leader>w-", "<C-W>v", { desc = "Split window right", remap = true })
keymap.set("n", "<leader>w_", "<C-W>s", { desc = "Split window below", remap = true })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")
keymap.set("n", "<leader>bd", ui_utils.bufremove, { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete buffer and window" })
keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Previous buffer" })

-- Navigate tabs
keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last tab" })
keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First tab" })
keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" })
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- Center screen when jumping with Ctrl-d and Ctrl-u
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen when jumping to searched words
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-s>", "<ESC>:w<CR>", { desc = "Use ctrl+s to save" })

keymap.set("n", "<CR>", ":nohl<CR>", { desc = "Clear search highlight on enter" })

-----------------
-- Insert Mode --
-----------------
keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Use ctrl+s to save and exit insert mode" })

-----------------
-- Visual Mode --
-----------------
-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
