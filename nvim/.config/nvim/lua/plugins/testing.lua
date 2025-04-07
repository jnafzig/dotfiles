return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
        local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})

		vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "Run nearest test" })
		vim.keymap.set("n", "<leader>dt", function() neotest.run.run({ strategy="dap"}) end, { desc = "Debug nearest test" })
		vim.keymap.set("n", "<leader>ts", neotest.run.stop, { desc = "Stop nearest test" })
		vim.keymap.set("n", "<leader>ta", neotest.run.attach, { desc = "Attach to nearest test" })
		vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run tests in current file" })
		vim.keymap.set("n", "<leader>tp", neotest.output_panel.toggle, { desc = "Toggle output panel" })
		vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { desc = "Open test result output" })
	end,
}
