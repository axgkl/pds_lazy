setlocal iskeyword+=$
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js,.jsx
setlocal path+=$PWD/node_modules
setlocal cinoptions+=j1,J1
setlocal sw=4

map <buffer> ,b Odebugger;<Esc>
map <buffer> ,e ^itry {<Esc>o} catch(e) {console.log(e); debugger;}<Esc>
