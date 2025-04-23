return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()
			lspconfig.ts_ls.setup({capabilities=capabilities})
            lspconfig.ruff.setup({capabilities=capabilities})
			lspconfig.pyright.setup({capabilities=capabilities})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' global in config files
						},
					},
				},
                capabilities=capabilities
			})

			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {desc="Show documentation hover"})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc="Go to definition"})
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {desc="Find references"})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc="Code actions"})
			vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {desc="Go to implementation"})
			vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, {desc="Go to type definition"})
			vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {desc="Rename symbol"})
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {desc="Show line diagnostics"})
			vim.keymap.set("n", "<leader>cj", vim.diagnostic.goto_next, {desc="Next diagnostic"})
			vim.keymap.set("n", "<leader>ck", vim.diagnostic.goto_prev, {desc="Previous diagnostic"})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
			local mason_null_ls = require("mason-null-ls")
			mason_null_ls.setup({
				ensure_installed = nil,
				automatic_installation = true,
			})
			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {desc="Code format"})
			vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", {desc="LSP info"})
			vim.keymap.set("n", "<leader>cs", "<cmd>LspStart<cr>", {desc="Start LSP"})
			vim.keymap.set("n", "<leader>cx", "<cmd>LspStop<cr>", {desc="Stop LSP"})
			vim.keymap.set("n", "<leader>cR", "<cmd>LspRestart<cr>", {desc="Restart LSP"})
		end,
	},
}
