
return {
    "folke/noice.nvim",
    dependencies = { 
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            cmdline = {
                format = {
                    cmdline = { icon = ">" },
                    search_down = { icon = "🔍⌄" },
                    search_up = { icon = "🔍⌃" },
                    filter = { icon = "$" },
                    lua = { icon = "Lua" },
                    help = { icon = "?" },
                },
            },
        })
        
        -- 设置快捷键, 当在normal状态下时, 按下Enter键盘可以打开cmdline
        vim.keymap.set("n", "<CR>", ":", { desc = "Open cmdline with Enter" })
    end
}
