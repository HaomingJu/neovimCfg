local opts = { noremap = true, silent = false }

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","


keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)

keymap("n", "<C-p>", ":LeaderfFile<CR>", opts)
keymap("n", "<C-f>", ":Leaderf bufTag --nowrap<CR>", opts)
keymap("n", "<C-i>", ":Leaderf mru --nowrap<CR>", opts)
keymap("n", "<C-e>", ":Leaderf mru --nowrap<CR>", opts)
keymap("n", "<Leader>h", ":LeaderfHistoryCmd<CR>", opts)
keymap("n", "<C-Space>", ":Leaderf! buffer --nowrap<CR>", opts)

--keymap("n", "ff", ":CocCommand explorer --width 35 --toggle --sources=file+<CR>", opts)
keymap("n", "ff", ":NERDTreeToggle<CR>", opts)
keymap("n", "tt", ":TagbarToggle<CR>", opts)

keymap("n", "<Esc><Esc>", ":quitall<CR>", opts)
keymap("n", "m", "gd", opts)
keymap("n", "fq", ":stop<CR>", opts)
keymap("n", "<C-s>", ":wa<CR>", opts)

keymap("n", "<Leader>f", ":CtrlSF <C-R><C-W><CR>", opts)

keymap("n", "<Leader>d", "<Plug>(coc-definition)", opts)
keymap("n", "<Leader>gd", "<Plug>(coc-definition)", opts)
keymap("n", "<Leader>gi", "<Plug>(coc-implementation)", opts)
keymap("n", "<Leader>e", ":CocDiagnostics<CR>", opts)

keymap("v", "c", "<Nop>", opts)
keymap("n", "<Leader>c", "<Nop>", opts)
keymap("n", "<Leader><Space>", ":Leaderf command<CR>", opts)
keymap("n", "ci", "<Plug>NERDCommenterInvert", opts)
keymap("v", "ci", "<Plug>NERDCommenterInvert", opts)
keymap("n", "<F7>", ":Neoformat<CR>", opts)

keymap("n", "<Leader>t", "<Plug>(coc-translator-p)", opts)
keymap("v", "<Leader>t", "<Plug>(coc-translator-pv)", opts)
keymap('n', "<F5>", ":LeaderfMR<CR>", opts)
keymap('v', "<F5>", ":LeaderfMR<CR>", opts)

keymap("n", "<F8>", "<Plug>(coc-fix-current)", opts)



-- 双击键位
vim.cmd([[
    set timeoutlen=300
    noremap <Space><Space> :Leaderf command<CR>
]])

-- 自定义条件键位
local setQuitKey = function ()
    local buf_opt_modify = vim.api.nvim_buf_get_option(0, 'modifiable')
    if buf_opt_modify == false then
        buf_keymap(0, "n", "q", ":quit<CR>", opts)
    end
end
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {callback = setQuitKey})
