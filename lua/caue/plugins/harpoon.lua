return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local telescope_conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = telescope_conf.file_previewer({}),
					sorter = telescope_conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>fh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Find harpooned files" })
	end,
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local keys = {
			{
				"<leader>hh",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon mark file",
			},
			{
				"<leader>hH",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon quick menu",
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>h" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "Harpoon to file " .. i,
			})
		end
		return keys
	end,
}
