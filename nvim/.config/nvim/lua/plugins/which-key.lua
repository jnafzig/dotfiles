return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			["<leader>"] = {
				c = { group = "+Code/LSP" },
				t = { group = "+Testing" },
				d = { group = "+Debug" },
				s = { group = "+Sessions" },
				f = { group = "+Find/Telescope" },
			},
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
