-- 全局选项：行号、缩进、编码等（set 相关配置）

vim.opt.shortmess:append("c")
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.history = 1024
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showfulltag = true
vim.opt.ruler = true
vim.opt.autoread = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.cmdheight = 1
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.laststatus = 3 -- 全局状态栏(NeoVim0.7)
vim.opt.mouse = "v" -- allow the mouse to be used in neovim
vim.opt.swapfile = false

-- WSL clipboard support
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
    }
end

-- if vim.g.neovide then  -- 仅对 GUI 客户端生效
--   vim.o.guifont = "JetBrainsMono Nerd Font:h12"  -- 字体名称和大小
-- end