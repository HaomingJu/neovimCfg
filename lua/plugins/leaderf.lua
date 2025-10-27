return {
    {
        "Yggdroot/LeaderF",
        keys = {
            { "<C-p>", "<CMD>Leaderf file --no-auto-preview<CR>", mode = "n", desc = "LeaderF 文件搜索" },
            { "<C-i>", "<CMD>Leaderf mru --no-auto-preview --fullPath<CR>", mode = "n", desc = "LeaderF MRU搜索" },
            { "<C-e>", "<CMD>Leaderf mru --no-auto-preview --fullPath<CR>", mode = "n", desc = "LeaderF MRU搜索" },
            { "<C-f>", "<CMD>Leaderf function --no-auto-preview<CR>", mode = "n", desc = "LeaderF 函数搜索" },
            { "<F2>", "<CMD>Leaderf filetype --no-auto-preview<CR>", mode = "n", desc = "LeaderF 文件类型搜索" },
        },

        config = function()
            vim.g.Lf_PopupBorders = { "", "", "", "", "", "", "", "" }
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
        end,
    }
}