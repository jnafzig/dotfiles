return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "pyright" },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({})
            lspconfig.pyright.setup({
            })
            lspconfig.lua_ls.setup({
                settings = {
                   Lua = {
                     diagnostics = {
                       globals = { 'vim' }, -- Recognize 'vim' global in config files
                     },
                   },
                 },
            })

            vim.keymap.set('n', '<C-i>', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
