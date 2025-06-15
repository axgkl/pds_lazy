colorscheme kanagawa
"setlocal foldmethod=indent
setlocal sw=4
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "bash", -- Install bash parser
"   highlight = {
"     enable = true, -- Enable syntax highlighting
"   },
"   fold = {
"     enable = true, -- Enable folding
"   },
" }
" EOF
"  word into variable
nmap ,v diwi "${:-}"<ESC>hhhhp

nmap ,b 0_iset -x<CR><Esc>
nmap ," viWsa"<ESC>
nmap ,' viWsa'<ESC>
nmap ,) viWsa)viWsa"i$<ESC>
nmap ,} viWsa}viWsa"i$<ESC>
" Bash folding configuration
setlocal ft=bash foldmethod=expr foldexpr=nvim_treesitter#foldexpr()

