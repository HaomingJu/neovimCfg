vim.cmd([[

function! AsynTime()
    return strftime("%Y-%m-%d %H:%M %a")
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode'], ['cocstatus'], ['relativepath'] ],
      \   'right': [ ['time'], ['fileformat'], ['fileencoding'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'time': 'AsynTime'
      \ }
      \ }
]])


-- In init.lua or filetype.nvim's config file
require("filetype").setup({
    overrides = {
        extensions = {
            -- 简单后缀
            bash = 'bash',
            sh = 'bash',
            zsh = 'zsh',
            arxml = 'xml',
            xml = 'xml',
            ini = 'confini',
            h = "cpp",
            launch = "xml",
            urdf = "xml",
            c = "c"
        },
        complex = {
            -- 正则匹配
            [".*git/config"] = "gitconfig",
            [".*cmake.in$"] = "cmake"
        }
    }
})
