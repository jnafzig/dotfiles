return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		-- Configure telescope with extensions
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- Additional dropdown configuration goes here
						width = 0.8,
						previewer = false,
						prompt_title = false,
						borderchars = {
							{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
							prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
							results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
							preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						},
					})
				}
			}
		})

		-- Load extensions
		require("telescope").load_extension("ui-select")

		-- Set up keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recent files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
