return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				extensions = {
					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " iglob " }),
								["<C-f>"] = lga_actions.quote_prompt({ postfix = " -t" }),
							},
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		--set keymaps
		local keymap = vim.keymap

		-- File and text searching keymaps
		keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Find file" })
		keymap.set(
			"n",
			"<leader>fH",
			"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-u', '--glob', '!*.git/*', '--glob', '!*node_modules' }})<CR>",
			{ desc = "Find including hidden files" }
		)
		keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep_args<CR>", { desc = "Find text" })
		keymap.set(
			"n",
			"<leader>fF",
			"<cmd>Telescope live_grep grep_open_files=true<CR>",
			{ desc = "Find text in currently open buffers" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
		keymap.set("n", "<leader>fR", "<cmd>Telescope resume<CR>", { desc = "Resume previous search" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
		---

		--- Git related keymaps
		keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Show branches" })
		keymap.set("n", "<leader>gc", "<cmd>Telescope git_bcommits<CR>", { desc = "Show buffer commits" })
		keymap.set("n", "<leader>gC", "<cmd>Telescope git_commits<CR>", { desc = "Show all repository commits" })
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Show current git status" })
		keymap.set("n", "<leader>gS", "<cmd>Telescope git_stash<CR>", { desc = "Show stash" })
	end,
}
