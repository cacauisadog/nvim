return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	branch = "regexp", -- use this for new version
	event = "VeryLazy", -- this is needed to avoid conflicts with Mason
	config = function()
		require("venv-selector").setup({
			settings = {
				options = {
					debug = false, -- enables you to run the VenvSelectLog command to view debug logs
					on_telescope_result_callback = nil, -- callback function for when a search result shows up in telescope
					on_venv_activate_callback = nil, -- callback function for when a venv is activated
					fd_binary_name = nil, -- plugin looks for `fd` or `fdfind` but you can set something else here
					enable_default_searches = true, -- switches all default searches on/off
					enable_cached_venvs = true, -- automatically activates the venv you used last time in a directory
					activate_venv_in_terminal = true, -- activate the selected python interpreter in terminal windows opened from neovim
					set_environment_variables = true, -- sets VIRTUAL_ENV or CONDA_PREFIX environment variables
					show_telescope_search_type = true, -- shows the name of the search in telescope
					notify_user_on_venv_activation = true, -- notifies user on activation of the virtual env
					search_timeout = 5, -- if a search takes longer than this many seconds, stop it and alert the user
				},
			},
		})
	end,
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
}
