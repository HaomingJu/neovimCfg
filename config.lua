local Cfg = {}

function Cfg.basic()
	local opts = { noremap = true, silent = false }
	local keymap = vim.api.nvim_set_keymap
	local buf_keymap = vim.api.nvim_buf_set_keymap
	keymap("", ";", "<Nop>", opts)
	vim.g.mapleader = ","
	vim.g.maplocalleader = ","
	keymap("n", "<C-h>", ":wincmd h<CR>", opts)
	keymap("n", "<C-l>", ":wincmd l<CR>", opts)
	keymap("n", "<C-k>", ":wincmd k<CR>", opts)
	keymap("n", "<C-j>", ":wincmd j<CR>", opts)
	keymap("n", "<Esc><Esc>", ":quitall<CR>", opts)
	keymap("n", "m", "gd", opts)
	keymap("n", "fq", ":stop<CR>", opts)
	keymap("n", "<C-s>", ":wa<CR>", opts)

	vim.opt.shortmess:append("c")
	vim.opt.number = true
	vim.opt.cursorline = true
	vim.opt.shiftwidth = 4
	vim.opt.expandtab = true
	vim.opt.termguicolors = true
	vim.opt.history = 1024
	vim.opt.showcmd = true
	vim.opt.showmatch = true
	vim.opt.showfulltag = true
	vim.opt.ruler = true
	vim.opt.autoread = true
	vim.opt.hlsearch = true
	vim.opt.ignorecase = true -- ignore case in search patterns
	vim.opt.cmdheight = 1
	vim.opt.encoding = "utf-8"
	vim.opt.fileencodings = "utf-8"
	vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
	vim.opt.laststatus = 3 -- 全局状态栏(NeoVim0.7)
	vim.opt.mouse = "v" -- allow the mouse to be used in neovim
	vim.opt.swapfile = false
end

function Cfg.colortheme()
	vim.o.background = "dark"
	--vim.cmd([[colorscheme gruvbox]])
        vim.cmd([[colorscheme tokyonight-moon]])

end

function Cfg.nerdtree()
	vim.g.NERDTreeMinimalUI = 1
	vim.g.NERDTreeIgnore = {
		"^devel",
		"^output",
		"^install",
		"^output_x86_64$",
		"pyc$",
		"__init__.py",
		"compile_commands.json",
		".+tar.gz",
		"cmake-build-debug",
		"cmake-build-release",
	}
end

function Cfg.leaderf()
	vim.g.Lf_WindowPosition = "popup"
	vim.g.Lf_PopupColorscheme = "default"
	vim.g.Lf_ShowDevIcons = 0
        vim.g.Lf_PopupPalette = {
            dark = {
                Lf_hl_cursorline = {
                    gui = 'NONE',
                    font = 'NONE',
                    guifg = 'NONE',
                    guibg = '#191970',
                    cterm = 'NONE',
                    ctermfg = 'NONE',
                    ctermbg = '100'
                }
            }
        }
end

function Cfg.treesitter()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"c",
			"cpp",
			"cmake",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"comment",
			"cuda",
			"dockerfile",
			"json",
		},
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end

function Cfg.filetype()
	require("filetype").setup({
		overrides = {
			extensions = {
				-- 简单后缀
				bash = "bash",
				sh = "bash",
				zsh = "zsh",
				arxml = "xml",
				xml = "xml",
				ini = "confini",
				h = "cpp",
				launch = "xml",
				urdf = "xml",
				c = "c",
			},
			complex = {
				-- 正则匹配
				[".*git/config"] = "gitconfig",
				[".*cmake.in$"] = "cmake",
				["Dockerfile*"] = "dockerfile",
                                ['Jenkinsfile*'] = "groovy",
			},
		},
	})
end

function Cfg.wiki()
        vim.g.vimwiki_list = {{path = '~/.config/vimwiki', syntax = 'markdown', ext = '.md'}}
        vim.g.vimwiki_global_ext = 0
end

function Cfg.indent_blankline()
    require("ibl").setup {
        scope = { enabled = true }
    }
end

return Cfg
