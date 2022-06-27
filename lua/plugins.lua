vim.cmd [[packadd packer.nvim]]


local packer = require('packer')
packer.init({package_root = "~/.config/nvim/pack/"})
packer.startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'preservim/nerdtree'
        use 'ellisonleao/gruvbox.nvim'
        use 'vim-ctrlspace/vim-ctrlspace'
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'easymotion/vim-easymotion'
        use 'dyng/ctrlsf.vim'
        use 'rking/ag.vim'
        use 'majutsushi/tagbar'
        use 'nvim-treesitter/nvim-treesitter'
        use 'vimwiki/vimwiki'
        use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
        use 'nathom/filetype.nvim'
        use 'mg979/vim-visual-multi'
        use 'scrooloose/nerdcommenter'
        use 'itchyny/lightline.vim'
        use {
            'ethanholz/nvim-lastplace',
            config = function ()
                require('nvim-lastplace').setup()
            end
        }
        use {'sbdchd/neoformat', run = 'python3 -m pip install cmakelang'}
        use 'tveskag/nvim-blame-line'
        use 'HaomingJu/LeaderF-gitlab'
        use 'github/copilot.vim'
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
