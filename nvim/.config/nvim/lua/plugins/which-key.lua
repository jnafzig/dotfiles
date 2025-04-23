return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.add({
			{ "<leader>c", group = "Code/LSP" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find/Telescope" },
			{ "<leader>s", group = "Sessions" },
			{ "<leader>t", group = "Testing" },
		})
	end,
}
