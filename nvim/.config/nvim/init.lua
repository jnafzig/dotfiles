vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set pastetoggle=<F10>")
vim.cmd("set hidden")
vim.cmd("set number")
vim.cmd("set signcolumn=number")
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<A-l>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-h>", ":bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem filesystem reveal right<CR>", { desc = "Open Neotree" })

require("config.lazy")


