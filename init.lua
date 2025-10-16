vim.cmd([[packadd packer.nvim]])

local home_path = os.getenv("HOME")
package.path = package.path .. ";" .. home_path .. "/.config/nvim/?.lua"

-- 一般性快捷键
require("config").basic()
require("config").colortheme()

local packer = require("packer")
packer.init({
	package_root = "~/.config/nvim/pack/",
	git = {
		depth = 1,
	},
	clone_timeout = 120,
})

packer.startup(function()
	use("wbthomason/packer.nvim")
        use("folke/tokyonight.nvim")
        use("ellisonleao/gruvbox.nvim")
	use({
		"preservim/nerdtree",
		config = function()
			require("config").nerdtree()
			require("keymap").nerdtree()
		end,
	})

	use({
		"sbdchd/neoformat",
		config = function()
			require("keymap").neoformat()
		end,
		--run = "python3 -m pip install cmakelang",
	})

	use({
		"Yggdroot/LeaderF",
		config = function()
			require("config").leaderf()
			require("keymap").leaderf()
		end,
		run = ":LeaderfInstallCExtension",
		tag = "v1.23",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config").treesitter()
		end,
		run = "TSUpdate",
	})

	use({
		"neoclide/coc.nvim",
		config = function()
			require("coc-config")
		end,
		tag = "v0.0.82",
	})

	use({
		"vimwiki/vimwiki",
		config = function()
                        require("config").wiki()
		end,
	})

	use({
		"nathom/filetype.nvim",
		config = function()
			require("config").filetype()
		end,
	})

	use({
		"scrooloose/nerdcommenter",
		config = function()
			require("keymap").nerdcommenter()
		end,
	})

	use({
		"dyng/ctrlsf.vim",
		config = function()
			require("keymap").ctrlsf()
		end,
	})

	use({
		"majutsushi/tagbar",
		config = function()
			require("keymap").tagbar()
		end,
	})

        --use 'Exafunction/codeium.vim'
        use 'github/copilot.vim'
	use("easymotion/vim-easymotion")
        use("mg979/vim-visual-multi")

        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("config").indent_blankline()
            end,
        })

        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup()
            end,
        })

	--use({ "vladdoster/remember.nvim", config = [[ require('remember') ]] })
	--use("rking/ag.vim")
	--use("Yggdroot/indentLine")
end)
