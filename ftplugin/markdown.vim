setl conceallevel=0
" Mappings
"nmap <silent><buffer> ,p :call TogglePresent()<CR>
nmap <silent><buffer> ,P :MarkdownPreviewToggle<CR>
nnoremap ,T    vip:Tabularize/\|<CR>
map <buffer> ,i    ysiw_
map <buffer> ,b    ysiw*lysiw*
map <buffer> ,a    ysiw`

