vim.cmd([[

let g:coc_config_home = '~/.config/nvim/lua/plugin-config'

"Coc 插件
call coc#add_extension('coc-json', 'coc-cmake', 'coc-snippets', 'coc-pairs', 'coc-pyright', 'coc-vimlsp', 'coc-docker', 'coc-sumneko-lua', 'coc-ultisnips', 'coc-clangd')

" Coc补全, Tab触发
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : coc#refresh()

" 取消<C-e>原有功能, 将其置为expand展开功能
map <C-e> <NOP>
inoremap <silent><expr> <C-e>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳转至定义处
nmap <Leader>d <Plug>(coc-definition)


"函数签名提示
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set updatetime=300
set shortmess+=c

autocmd CursorHold * silent call CocActionAsync('highlight')

]])
