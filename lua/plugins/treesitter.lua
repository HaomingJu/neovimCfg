return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- ensure_installed = { "c", "cpp", "cmake", "lua", "vim", "vimdoc", "bash", "comment", "dockerfile", "json", "yaml" },
                -- sync_install = true,
                -- auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    }
}