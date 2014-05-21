setl tw=80 sw=2
setl iskeyword+=:,-
setl spelllang+=ru
" setl complete+=k~/.vim/dictionary/latex
let &l:complete .= ',k~' . $VIMFILES . '/dictionary/latex'
" setl dict+=~/.vim/dictionary/latex
let &l:dict .= ',' . $VIMFILES . '/dictionary/latex'
let &l:spellfile .= ',' . $VIMFILES . '/spell/ru-terms.utf-8.add'
