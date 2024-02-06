" " syntax match pythonOperator "=" conceal cchar=≢
" "
" " hi link pythonOperator Operator
" " hi! link Conceal Operator
" "
" let g:polyglot_disabled = ['autoindent']
" let g:python_html_injection = 1

" setlocal conceallevel=1
setlocal textwidth=200
" setlocal foldmethod=indent
setlocal foldenable
let g:SimpylFold_docstring_preview = 1
""map ,b Obreakpoint() # FIXME BREAKPOINT<C-c>
map ,b 0_ibreakpoint() # FIXME BREAKPOINT<CR><Esc>:w<CR>:lua vim.notify('file saved with set breakpoint')<CR>

"map ,e   Otry:<Esc>j^i<TAB><Esc>oexcept Exception as ex:<CR>print('breakpoint set')<CR>breakpoint()<CR>keep_ctx=True<Esc>^
map ,e   yyppkkCtry:<Esc>j^i<TAB><Esc>j^Cexcept Exception as ex:<CR>print('breakpoint set')<CR>breakpoint()<CR>keep_ctx=True<Esc>^
" map ,l J0fdxxxxf(xi=lambda <Esc>f)xllcw
" nmap <C-Left> <Nop>
"
" nnoremap <C-Left>  :echo "foobar"<CR>
" nmap <C-Left>  :echo "foobar"<CR>
" nnoremap <C-A>  :echo "foobar"<CR>
" nnoremap ,L ^idef <Esc>f d2f i(<Esc>f:i)<Esc>lli return 
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal autoindent
setlocal cindent
let g:python_highlight_all = 1



" on demand, pyright LSP is just the right amount of information for me:
":ALEDisable


