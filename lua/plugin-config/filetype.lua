vim.g.did_load_filetypes = 1

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

au BufNewFile,BufRead *.arxml setf xml
au BufNewFile,BufRead *.cmake setf cmake
au BufNewFile,BufRead *.cmake.in setf cmake
]])
