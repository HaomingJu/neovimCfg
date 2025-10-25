return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
            -- TODO: 配置Toggle快捷键
            vim.keymap.set("n", "ff", "<Cmd>Neotree toggle<CR>")
            
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["f"] = "none", -- 取消f键的搜索功能
                    },
                },
            })
        end,
    },
}

-- https://github.com/folke/snacks.nvim