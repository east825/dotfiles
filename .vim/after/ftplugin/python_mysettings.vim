" PEP8 standarts:
setlocal textwidth=79

nmap <buffer> <silent> <F5> <Esc>:silent w<CR>:!python3 %<CR><CR>
" map! <buffer> <silent> <F5> <Esc>:silent w<CR>:!C:\Python31\python.exe %<CR><CR>
nmap <buffer> <silent> <S-F5> <Esc>:silent w<CR>:!python2 %<CR><CR>
" map! <buffer> <silent> <S-F6> <Esc>:silent w<CR>:!C:/Python27/python.exe %<CR><CR>

compiler mypylint
