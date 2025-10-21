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
    local highlight = { "RainbowRed", "RainbowYellow", "RainbowBlue", "RainbowOrange", "RainbowGreen", "RainbowViolet", "RainbowCyan" }
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP,
        function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end
    )
    require("ibl").setup { indent = { highlight = highlight } }
    --require("ibl").setup { scope = { highlight = highlight } }

end

function Cfg.cmp()
    -- 加载friendly-snippets代码片段
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        }),
    })
    
    -- 启动LSP
    vim.lsp.config("clangd", {
        cmd = {
            "clangd",
            "--background-index",               -- 后台建立索引
            "--compile-commands-dir=build",     -- 指定编译命令目录（可选）
            "--header-insertion=never",         -- 关闭自动插入头文件
            "--all-scopes-completion",          -- 所有作用域的补全
            "--completion-style=detailed",      -- 详细的补全样式
            "--pch-storage=memory",
            "--clang-tidy",
            "--enable-config",
            "--query-driver=/opt/clangd_*/lib/clang/*/include"
        }
    })
    vim.lsp.config("cmake", {
        cmd = {
            "cmake-language-server"
        }
    })
    vim.lsp.config("yaml", {
        cmd = {
            "yaml-language-server",
            "--stdio"
        },
        -- 加载schema文件
        settings = {
            yaml = {
                -- 1. 使用schemastore中的schema
                schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/api/json/catalog.json"
                },
                -- 2. 自定义schema
                schemas = {
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                    ["https://raw.githubusercontent.com/awslabs/goformation/v5.5.0/schema/cloudformation.schema.json"] = "template*.yml",
                    ["pipeline-schema.json"] = "*pipeline*.yml"
                }
            },
            completion = true,
            hover = true,
            validate = true,
            fileMatch = { "*.yml", "*.yaml" }
        }
    })

    vim.lsp.enable('pyright')
    vim.lsp.enable('clangd')
    vim.lsp.enable('cmake')
    vim.lsp.enable('yaml')

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
    })

end
return Cfg
