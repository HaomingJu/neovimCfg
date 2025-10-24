return {
    -- Codeium AI插件
    {
        "Exafunction/windsurf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                -- TODO: 配置补全标志
            })
        end,
    },
    
    -- Copilot AI插件
    -- INFO: https://github.com/onsails/lspkind.nvim
    -- INFO: https://github.com/zbirenbaum/copilot-cmp
    -- INFO: https://github.com/zbirenbaum/copilot.lua
    -- TODO: https://github.com/CopilotC-Nvim/CopilotChat.nvim
    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            "zbirenbaum/copilot-cmp"
        },
        config = function()
            require("copilot_cmp").setup()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    }
}