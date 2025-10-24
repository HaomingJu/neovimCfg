return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("mason").setup()
            
            -- 直接配置clangd using new vim.lsp.config API
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            vim.lsp.config.clangd = {
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
                capabilities = capabilities,
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            }
            
            -- 
            vim.lsp.config.pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        }
                    }
                }
            }

            -- Enable clangd
            vim.lsp.enable('clangd')
            vim.lsp.enable('pyright')
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
                        vim_item.kind = string.format('%s %s', ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            codeium = "Codeium",
                            copilot = "[Copilot]",
                        })[entry.source.name] or "", vim_item.kind)
                        
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