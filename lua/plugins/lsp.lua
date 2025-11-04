return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason-lspconfig.nvim"
        },
        config = function()
            vim.lsp.config('clangd', {
                cmd = { 
                    "clangd",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--background-index=false", 
                    "--limit-references=0",    
                    "--all-scopes-completion=false",  
                    "--completion-style=detailed",  
                    "--limit-results=16",
                },
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "clangd" },
                automatic_enable = true,
            })
        end
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-emoji",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            -- 配置CMP自动补全相关
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            luasnip.config.set_config({
                history = true, -- 记住上次片段位置，支持回退
                updateevents = 'TextChanged,TextChangedI', -- 文本变化时更新片段
                enable_autosnippets = true, -- 允许自动展开片段
            })

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
                    -- Tab 键逻辑：
                    -- 1. 补全菜单可见时 → 选择下一个补全项
                    -- 2. 存在可跳转的片段占位符（形参）→ 跳至下一个形参
                    -- 3. 否则 → 执行默认 Tab 行为（插入制表符）
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump() -- 展开片段或跳至下一个形参
                        else
                            fallback() -- 回退到默认 Tab 行为
                        end
                    end, { 'i', 's' }), -- 插入模式和选择模式生效
                    -- Shift+Tab 逻辑：
                    -- 1. 补全菜单可见时 → 选择上一个补全项
                    -- 2. 存在可回退的片段占位符 → 跳回上一个形参
                    -- 3. 否则 → 执行默认 Shift+Tab 行为
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1) -- 跳回上一个形参
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),

                

                formatting = {
                    format = function(entry, vim_item)
                        -- 为不同源设置图标
                        vim_item.kind = string.format('%s %s', ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            copilot = "[Copilot]",
                        })[entry.source.name] or "", vim_item.kind)
                        
                        return vim_item
                    end
                },
                sources = cmp.config.sources({
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'emoji' }
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
    },

}
