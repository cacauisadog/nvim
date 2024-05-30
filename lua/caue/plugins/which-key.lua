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
			["<leader><Tab>"] = { name = "+Tabs" },
			["<leader>b"] = { name = "+Buffers" },
			["<leader>e"] = { name = "+Explorer" },
			["<leader>f"] = { name = "+Find" },
			["<leader>g"] = { name = "+Git" },
			["<leader>gh"] = { name = "+Hunks" },
			["<leader>h"] = { name = "+Harpoon" },
			["<leader>l"] = { name = "+Lsp" },
			["<leader>v"] = { name = "+Venv Python" },
			["<leader>w"] = { name = "+Windows" },
			["<leader>x"] = { name = "+Trouble" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
