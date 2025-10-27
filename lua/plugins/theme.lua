return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "ellisonleao/gruvbox.nvim"
        },
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox")
            -- vim.cmd.colorscheme("tokyonight")
        end
    }
}