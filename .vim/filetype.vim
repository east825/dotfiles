if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.{flex,jflex}       setf jflex
    au! BufRead,BufNewFile *.{8,08}             setf masm
    au! BufRead,BufNewFile *.{masm,asm}         setf masm
    au! BufRead,BufNewFile *.md                 setf markdown
    au! BufRead,BufNewFile *.user.defined       setf conf
    au! BufRead,BufNewFile *.log                setf conf
    au! BufRead,BufNewFile *.tex                setf tex
augroup END
