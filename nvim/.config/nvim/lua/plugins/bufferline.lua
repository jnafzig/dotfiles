return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
               separator_style = "slant",
               numbers = function(opts)
                   return opts.id
               end,
            }
        }
    end
}
