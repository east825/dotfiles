" encoding settings: open and write such files in cp866 (oem-866)
let name=expand("%")
if name =~ '\.\(08\|8\)$'
    execute "edit ++enc=cp866"
    setlocal fileencoding=cp866
elseif name =~ '\.\(masm\|asm\)$'
    execute "edit ++enc=cp1251"
    setlocal fileencoding=cp1251
endif
let b:local="I am here!"
" virtual tabs made by pressing 'tab' has size of real tab symbols
setlocal softtabstop=8
" indents from beginning just like real tabs
setlocal shiftwidth=8
" don't need here cause it's already set global
" setlocal tabstop=8
" i want real tabs here not spaces
setlocal noexpandtab
