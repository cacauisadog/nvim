return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mson_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>lL", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				opts.desc = "Document symbols"
				keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show document symbols

				-- diagnostics
				local diagnostic_goto = function(next, severity)
					local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
					severity = severity and vim.diagnostic.severity[severity] or nil
					return function()
						go({ severity = severity })
					end
				end
				keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
				keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
				keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
				keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
				keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
				keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
				keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- ["svelte"] = function()
			--   -- configure svelte server
			--   lspconfig["svelte"].setup({
			--     capabilities = capabilities,
			--     on_attach = function(client, bufnr)
			--       vim.api.nvim_create_autocmd("BufWritePost", {
			--         pattern = { "*.js", "*.ts" },
			--         callback = function(ctx)
			--           -- Here use ctx.match instead of ctx.file
			--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
			--         end,
			--       })
			--     end,
			--   })
			-- end,
			-- ["graphql"] = function()
			--   -- configure graphql language server
			--   lspconfig["graphql"].setup({
			--     capabilities = capabilities,
			--     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			--   })
			-- end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"astro",
						"html",
						"htmldjango",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
						"vue",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["ruff"] = function()
				-- Ruff for linting and formatting
				lspconfig["ruff"].setup({
					capabilities = capabilities,
					init_options = {
						settings = {
							args = {},
						},
					},
				})
			end,
			["pyright"] = function()
				-- Pyright for everything else
				lspconfig["pyright"].setup({
					settings = {
						pyright = {
							autoImportCompletion = true,
							-- using Ruff's import organizer
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								-- ignore all files for analysis to exclusively use Ruff for linting
								ignore = { "*" },
							},
						},
					},
				})
			end,
		})
	end,
}
