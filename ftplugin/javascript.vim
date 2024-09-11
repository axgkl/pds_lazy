setlocal iskeyword+=$
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js,.jsx
setlocal path+=$PWD/node_modules
setlocal cinoptions+=j1,J1
setlocal sw=4
" let g:vista_default_executive = 'nvim_lsp'
" let g:vista_fzf_preview = ['right:50%']
map <buffer> ,b Odebugger;<Esc>
map <buffer> ,e ^itry {<Esc>o} catch(e) {console.log(e); debugger;}<Esc>
" function! s:dummy(msg) abort
" endfunction
"
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
"     \ 'function': "\uf794",
"     \ 'variable': "\uf71b",
"     \ }
"
"let g:vista_echo_cursor = 0
"let g:vista_disable_statusline = 1
" let g:vista#renderer#ctags = {
"     \ 'variable': '',
"     \ 'function': '',
"     \ }
"
" let g:vista#renderer#enable_icon = 1
" let g:vista_icon_indent = ["▸ ", "▾ "]
" let g:vista_fold_toggle_icons = ['▸', '▾']
"
" " Suppress error messages
" silent! call vista#LogErr('s:dummy')
" silent! call vista#LogWarn('s:dummy')
