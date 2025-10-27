-- 基础键位：全局通用映射（如保存、退出、分屏）
-- 基础配置：设置领导者键（Leader key）
vim.g.mapleader = ","  -- 逗号作为领导者键
vim.g.maplocalleader = ","  -- 局部领导者键（用于缓冲区特定映射）

-- 辅助函数：简化映射配置
local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false  -- 默认 silent=true（不显示命令）
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- 窗口管理
map("n", "<C-h>", "<C-w>h", { desc = "跳转到左侧窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "跳转到下方窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "跳转到上方窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "跳转到右侧窗口" })

-- 插入模式下的上下左右（避免频繁按箭头键）
map("i", "<C-h>", "<Left>",     { desc = "左移" })
map("i", "<C-j>", "<Down>",     { desc = "下移" })
map("i", "<C-k>", "<Up>",       { desc = "上移" })
map("i", "<C-l>", "<Right>",    { desc = "右移" })

-- 一些快捷键
map("n", "<Esc><Esc>", ":quitall<CR>",  { desc = "快速退出窗口" })
map("n", "m", "gd",                     { desc = "高亮" })
map("n", "fq", ":stop<CR>",             { desc = "临时切出窗口" })
map("n", "<C-s>", ":wa<CR>",            { desc = "保存" })

