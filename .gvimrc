" vim: ff=unix ts=8 sw=4 sts=4 et

" run gVim in fullscreen mode on startup
au GUIEnter * simalt ~x
" no dialog prompts
set go-=c

" ## Powerline ##

if !has('win32')
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif
