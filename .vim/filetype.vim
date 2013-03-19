if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile {*.8,*.08}	    setfiletype masm
  au! BufRead,BufNewFile {*.masm,*.asm}	    setfiletype masm
  au! BufRead,BufNewFile *.md	            setfiletype markdown
  au! BufRead,BufNewFile *user.defined      setfiletype conf
  au! BufRead,BufNewFile *.log              setfiletype conf
augroup END
