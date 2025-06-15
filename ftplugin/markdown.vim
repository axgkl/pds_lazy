setl conceallevel=0

" slidev collides with prettier's spaces around headers:
" switch on with leader uf
lua vim.g.autoformat = false
" Mappings
"nmap <silent><buffer> ,p :call TogglePresent()<CR>
nmap <silent><buffer> ,P :MarkdownPreviewToggle<CR>
nnoremap ,T    vip:Tabularize/\|<CR>

nmap <buffer> <C-i>    viw<C-i>
nmap <buffer> <C-b>    viw<C-b>
nmap <buffer> <C-a>    viw<C-a>
nmap <buffer> <C-l>    viw<C-l>

vmap <buffer> <C-i>    di_<Esc>pli_<Esc>
vmap <buffer> <C-b>    di**<Esc>pli**<Esc>
vmap <buffer> <C-a>    di`<Esc>pli`<Esc>
vmap <buffer> <C-l>    "adi[<Esc>"apli]()<Esc>

