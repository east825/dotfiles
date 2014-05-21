" ## Powerline ##

if !has('win32')
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif
