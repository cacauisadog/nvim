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

			-- Hide the buffer shortcuts from which-key
			["<leader>1"] = "which_key_ignore",
			["<leader>2"] = "which_key_ignore",
			["<leader>3"] = "which_key_ignore",
			["<leader>4"] = "which_key_ignore",
			["<leader>5"] = "which_key_ignore",
			["<leader>6"] = "which_key_ignore",
			["<leader>7"] = "which_key_ignore",
			["<leader>8"] = "which_key_ignore",
			["<leader>9"] = "which_key_ignore",
			["<leader>$"] = "which_key_ignore",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
