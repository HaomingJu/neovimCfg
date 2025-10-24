local Toggle = true

local ConfigInfo = {
    "folke/tokyonight.nvim",    
    dependencies = { 
        "ellisonleao/gruvbox.nvim" 
    },
    config = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end
    }
    -- TODO: font theme config

if Toggle then
    return { ConfigInfo }
else
    return {}
end