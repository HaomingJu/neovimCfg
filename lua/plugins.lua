vim.cmd [[packadd packer.nvim]]


local packer = require('packer')
packer.init({package_root = "~/.config/nvim/pack/"})
packer.startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'ellisonleao/gruvbox.nvim'
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'easymotion/vim-easymotion'
        use 'dyng/ctrlsf.vim'
        use 'rking/ag.vim'
        use 'majutsushi/tagbar'
        use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
        use 'lervag/wiki.vim'
        use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension', tag = 'v1.23'}
        use 'nathom/filetype.nvim'
        use 'mg979/vim-visual-multi'
        use 'scrooloose/nerdcommenter'
        use 'preservim/nerdtree'
        use 'itchyny/lightline.vim'
        use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })
        use {'sbdchd/neoformat', run = 'python3 -m pip install cmakelang'}
        use 'tveskag/nvim-blame-line'
        use 'Yggdroot/indentLine'
        use 'gennaro-tedesco/nvim-peekup'
        use {'skywind3000/asynctasks.vim', requires = {'skywind3000/asynctasks.vim', 'skywind3000/asyncrun.vim'}}
        --use 'github/copilot.vim'
    end
    )

require('plugin-config/gruvbox')
require('plugin-config/nvim-treesitter')
require('plugin-config/vimwiki')
require('plugin-config/coc')
require('plugin-config/LeaderF')
require('plugin-config/filetype')
require('plugin-config/easymotion')
require('plugin-config/asynctasks')
