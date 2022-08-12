vim.cmd([[

    let g:coc_config_home = '~/.config/nvim/lua/plugin-config'
    let g:coc_global_extensions = ['coc-cmake', 'coc-snippets', 'coc-pairs', 'coc-pyright', 'coc-vimlsp', 'coc-docker', 'coc-ultisnips', 'coc-clangd', 'coc-sumneko-lua', 'coc-clang-format-style-options']

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show documentation for the current word
nnoremap <silent> K :call <SID>show_documentation()<CR>

" jump to the definition of the current word
nmap <Leader>d <Plug>(coc-definition)                           

" show signature help for the current word
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp') 

" auto highlight the current word
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Let tab can jump outside of ">" or ")" on insert mode
let g:coc_snippet_next = '<tab>'


" https://www.ditig.com/256-colors-cheat-sheet
hi CocSearch    ctermfg=None    guibg=None
hi CocMenuSel   ctermbg=34      guibg=#808080


set updatetime=300
set shortmess+=c
]])

