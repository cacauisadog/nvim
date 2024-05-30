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

		keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find string under cursor" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep_args<CR>", { desc = "Find text" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
	end,
}
