" vim: ff=unix ts=8 sw=4 sts=4 et

set guifont=JetBrains\ Mono\ 10,Consolas:h11:cRUSSIAN

if has('win32')
    " run gVim in fullscreen mode on startup (only win32)
    au GUIEnter * simalt ~x
endif

" no dialog prompts
set go-=c

