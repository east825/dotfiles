" vim: ff=unix ts=8 sw=4 sts=4 et

if has('win32')
    " run gVim in fullscreen mode on startup (only win32)
    au GUIEnter * simalt ~x
endif

" no dialog prompts
set go-=c

" ## Powerline ##

if !has('win32')
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif
