vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- words won't wrap around

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- unless it's mixed case, then it's case-sensitive

opt.cursorline = true -- highlight the current line

-- turn on termguicolors for more complex colorschemes to work
-- have to use a terminal supports this (iterm2, wezterm, etc)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that support light and dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line ou insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
