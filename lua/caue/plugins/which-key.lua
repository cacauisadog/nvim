return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			{ "<leader>$", hidden = true },
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },
			{ "<leader>5", hidden = true },
			{ "<leader>6", hidden = true },
			{ "<leader>7", hidden = true },
			{ "<leader>8", hidden = true },
			{ "<leader>9", hidden = true },
			{ "<leader><Tab>", group = "Tabs" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gh", group = "Hunks" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>l", group = "Lsp" },
			{ "<leader>v", group = "Venv Python" },
			{ "<leader>w", group = "Windows" },
			{ "<leader>x", group = "Trouble" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add(opts.defaults)
	end,
}
