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

" Bash folding configuration
setlocal ft=bash foldmethod=expr foldexpr=nvim_treesitter#foldexpr()

