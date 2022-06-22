vim.cmd([[
    let g:Lf_HideHelp = 1
    let g:Lf_WindowHeight=0.3
    let g:Lf_PopupColorscheme = 'default'
    let g:Lf_ShowDevIcons=0
    let g:Lf_HistoryNumber=1000
    let g:Lf_DefaultExternalTool='ag'
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_WildIgnore = {
            \'dir': ['.git', 'build', '*output*', 'devel'],
            \ 'file': ['*.o', '*.so', '*.py[co]', 'compile_commands.json', '.cache*']
            \}

    let g:Lf_PreviewResult = {
            \ 'File': 0,
            \ 'Buffer': 0,
            \ 'Mru': 0,
            \ 'Tag': 0,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 0,
            \ 'Colorscheme': 0,
            \ 'Rg': 0,
            \ 'Gtags': 0
            \}
]])
