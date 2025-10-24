return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "clangd" },
                automatic_enable = true,
            })
            -- TODO: 为LSP服务器添加自定义配置
            

        end
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            -- 配置CMP自动补全相关
            require("luasnip.loaders.from_vscode").lazy_load()
            
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),

                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                formatting = {
                    format = function(entry, vim_item)
                        -- 为不同源设置图标
                        -- vim_item.kind = string.format('%s %s', ({
                        --     nvim_lsp = "[LSP]",
                        --     luasnip = "[Snippet]",
                        --     buffer = "[Buffer]",
                        --     path = "[Path]",
                        --     codeium = "[AI]",
                        -- })[entry.source.name] or "", vim_item.kind)
                        
                        -- 显示来源
                        -- INFO: https://www.nerdfonts.com/cheat-sheet
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            codeium = "[Codeium]",
                            copilot = "[Copilot]",
                        })[entry.source.name]
                        
                        return vim_item
                    end
                },
                sources = cmp.config.sources({
                    { name = 'copilot' },
                    { name = 'codeium' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })
        end
    }
}