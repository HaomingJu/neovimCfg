vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init({package_root = "~/.config/nvim/pack/"})
packer.startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'ellisonleao/gruvbox.nvim'
        use 'vim-ctrlspace/vim-ctrlspace'
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'easymotion/vim-easymotion'
        use 'dyng/ctrlsf.vim'
        use 'preservim/nerdtree'
        use 'rking/ag.vim'
        use 'majutsushi/tagbar'
        use 'nvim-treesitter/nvim-treesitter'
        use 'vimwiki/vimwiki'
        use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
        use 'nathom/filetype.nvim'
        use 'mg979/vim-visual-multi'
        use 'scrooloose/nerdcommenter'
        use 'itchyny/lightline.vim'
        use {'github/copilot.vim', run = ':Copilot setup'}
        use {
            'ethanholz/nvim-lastplace',
            config = function ()
                require('nvim-lastplace').setup()
            end
        }
        use {'sbdchd/neoformat', run = 'python3 -m pip install cmakelang'}
        use 'tveskag/nvim-blame-line'
        use 'rcarriga/nvim-notify'
    end
    )


require('plugin-config/gruvbox')
require('plugin-config/nvim-treesitter')
require('plugin-config/vimwiki')
require('plugin-config/coc')
require('plugin-config/nerdtree')
require('plugin-config/vim-ctrlspace')
require('plugin-config/LeaderF')
require('plugin-config/filetype')
require('plugin-config/easymotion')
