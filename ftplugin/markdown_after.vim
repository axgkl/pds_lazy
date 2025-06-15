"colorscheme catppuccin
lua vim.diagnostic.enable(false)
" lua LazyVim.toggle.diagnostics()

" "syntax keyword Normal foo conceal cchar=🟧
"
" "TSDisable highlight

" " stolen from lsp_markdown:
" " Conceal backticks (which delimit code fragments). We ignore g:markdown_syntax_conceal here.
" " syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart concealends
" " syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart concealends
" " syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*````*.*$" end="^\s*````*\ze\s*$" keepend concealends
" " Highlight code fragments.
" hi def link markdownCode Special
" hi def link markdownBlockquote            Error
"
" " syn match  mkdListBullet1                              "\*"                                                                                  contained conceal cchar=
"
" syn region htmlH1              matchgroup=mkdDelimiter start="^\s*#"                                  end="\($\|[^\\]#\+\)"                  concealends contains=@Spell,mkdEscapeChar
" syn match markdownListMarker1 "^\s[A]\%(\s\+\S\)\@="  conceal cchar=X
" hi link markdownListMarker1           htmlH1
" highlight MyGroup ctermbg=green guibg=green
" match MyGroup /asdf/

" Copy Clear
" ◉ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ❂ ☢ ⊗ ⊙ ◘ ◙ ◚ ◛ ◜ ◝ ◞ ◟ ◠ ◡ ◯ 〇 〶 ⚫ ⬤ ◦ ∅ ∘ ⊕ ⊖ ⊘ ⊚ ⊛ ⊜ ⊝ ❍ ⦿
"syn match header1 "^# " conceal cchar=X
"
" 🟡🟨🟧🟥🟦🟩🟫🟪◉ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ❂ ☢ ⊗ ⊙ ◘ ◙ ◚ ◛ ◜ ◝ ◞ ◟ ◠ ◡ ◯ 〇 〶 ⚫ ⬤ ◦ ∅ ∘ ⊕ ⊖ ⊘ ⊚ ⊛ ⊜ ⊝ ❍ ⦿
"syntax match header4 "^#### " conceal cchar=🟥 
" http://www.vimregex.com/
syntax match ax1 "◢" 
syntax match ax2 "▨ "
syntax match ax3 "◤" 
syntax match ax4 "◥" 
syntax match ax5 "◣" 
hi axirosf ctermfg=Red guifg=#8bd124 
hi axiros ctermfg=Red guifg=#8bd124
hi link ax2 axirosf
hi link ax1 axiros
hi link ax3 axiros
hi link ax4 axiros
hi link ax5 axiros

syntax keyword icos 🚌

syntax match icos "🌈" contained 
syntax match icos "🦄" contained
syntax match icos "🏎️" contained 
syntax match icos "🚀" contained 
syntax match icos "🚛" contained 
"syntax match icos "🚌" contained
syntax match icos "🚙" contained
syntax match icos "🍾" contained
syntax match axicos "☛" contained
syntax match axicos "⮚" contained
hi link icos unic
hi unic ctermfg=Red guifg=#000000 guibg=#FFFFFF 
hi link axicos axunic
hi axunic ctermbg=Red guifg=#8bd124 gui=bold

 
syntax match icos "🚌" contained
" syntax match hide1 "◌\s.*$" conceal
" hi link hide1 Comment
" syntax match header4 "^## " conceal cchar=🟥 
" "
" ◌ v i: tw=60 -> don't show in present mode
