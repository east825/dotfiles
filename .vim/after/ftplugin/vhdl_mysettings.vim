" editor in Quartus II has 4 space per tab
" don't paly with tabs here!
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal makeprg=vcom\ %
smasmetlocal makeef=errors
setlocal errorformat=**\ Error:\ %f(%l):\ %m

iabbrev slv std_logic_vector
iabbrev sl  std_logic
au  QuickfixCmdPre make silent w 
