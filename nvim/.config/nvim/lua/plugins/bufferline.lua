return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() 
        vim.opt.termguicolors = true
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
               separator_style = "slant"
            }
        }
    end
}
