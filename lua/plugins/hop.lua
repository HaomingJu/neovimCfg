return {
    {
        'phaazon/hop.nvim',
         config = function()
             require("hop").setup {}
             vim.keymap.set('n', '<Leader><Leader>b', ':HopWordBC<CR>', { noremap = true, silent = true })
             vim.keymap.set('n', '<Leader><Leader>e', ':HopWordAC<CR>', { noremap = true, silent = true })
             vim.keymap.set('n', '<Leader><Leader>j', ':HopLineAC<CR>', { noremap = true, silent = true })
             vim.keymap.set('n', '<Leader><Leader>k', ':HopLineBC<CR>', { noremap = true, silent = true })
         end    
    }
}