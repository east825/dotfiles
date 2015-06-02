" vim: ff=unix ts=8 sw=4 sts=4 et

" Pathogen initialization

execute pathogen#infect()
" track original user-settings directory
let $VIMFILES=split(&rtp, ',')[0]

" ## Miscellaneous settings ##

set encoding=utf-8 fileencoding=utf-8

set nocompatible
syntax on
set number
filetype plugin indent on
set showcmd
set showmode    " show the current mode
set cursorline  " highlight current line
set visualbell  " turn off nasty beep
set hidden      " allow to switch buffers in window without saving
set noswapfile  " it usually just mess me
" set autochdir   " always switch to the current file directory
set backspace=indent,eol,start 
set virtualedit=block
" selection mode settings
set keymodel=startsel,stopsel
set selectmode=key
set nrformats-=octal
set autoread
set scrolloff=1
set go=em

runtime macros/matchit.vim

" ## Clipboard ##

" see help topics: gui-clipboard, x11-selections and manual 09.3 section
if has('win_32')
    set clipboard^=unnamed
elseif has('unix')
    set go+=a   " enable autoselect in vim
    set clipboard^=unnamedplus
endif

" ## Status line ##

set laststatus=2 "always show status line

" helper function for displaying current keymap
function! ChangeLang()
    if &iminsert == 0
        " hi StatusLine guifg=White guibg=#4e4e4e
        return 'ENG'
    else
        " hi StatusLine guifg=#005f87 guibg=#afdfff
        return 'LANG'
    endif
endfunction

set statusline=
set stl+=%f\ %r%m%y
set stl+=[%{(empty(&fenc)?&enc:&fenc).(&bomb?\",BOM\":\"\")}]           " encoding detection
set stl+=[#%n]                                                          " buffer number
set stl+=%=                                                             " alignement delimeter
set stl+=Line:\ %4l\ of\ %L(%P)\                                        " line number
set stl+=Col:%4c\ 
set stl+=Char:0x%B\                                                     " character code
" set stl+=Lang:%k
set stl+=Lang:\ %{ChangeLang()}\                                        " language layout

" ## Searching ##

set incsearch
set ignorecase
set smartcase
set hlsearch
nohlsearch

" ## Indentation and tabs ##

set autoindent      " turn on autoindent
set smartindent     " c-like indents
set tabstop=8       " size of exisiting tabs
set shiftwidth=4    " size of indents (>> and << operations and tabs if 'smarttab' is on)
set smarttab
set softtabstop=4
set expandtab

" ## Wild menu ##

set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*.pyc,*swp

" ## Nonprintable characters mode ##

set nolist      " disable hidden charactes display at startup
set listchars=tab:->,trail:-,eol:$,nbsp:.,precedes:<,extends:>
set showbreak=>>

" ## Keymap ##

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" ## Color and fonts

if has('gui_running')
    if has('gui_win32')
        " use ":set guifont=*" to choose another one
        set guifont=Consolas:h11:cRUSSIAN
    elseif has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    endif
endif

colorscheme Tomorrow-Night

" hacky way to make spellfile location platform independent
let &spellfile = $VIMFILES . '/spell/en.utf-8.add'

" ################# Auto Commands #################

" Source the vimrc file after saving it (taken from vimcasts and bestofvim)
if has("autocmd")
    augroup ReloadVimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END
endif

" ################# Mappings #################

let mapleader = ','
noremap \ ,

map Y y$
nnoremap & :&&<CR>
xnoremap & :&&<CR>
noremap ,n<Space> :NERDTreeToggle<CR>

" full path to current buffer (name can be received directly from % register)
nnoremap <silent> ,gp :let @+=expand("%:p")<CR>
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

nnoremap <silent> <F3> :set list!<CR>
" map <silent> <F2> :set paste!<CR>
set pastetoggle=<F2>
nnoremap <silent> <F4> :set wrap!<CR>
nnoremap <silent> <F5> :set spell!<CR>

" IDEA like mappings tab switching
nnoremap <A-Left> gT
nnoremap <A-Right> gt

" ## Derek Wyatt's shortcuts ##

" edit .vimrc 
noremap <silent> <leader>ev :e $MYVIMRC<CR>
" source .vimrc
noremap <silent> <leader>sv :so $MYVIMRC<CR>

" ## Some useful mappings from Janus ##

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>
nmap <silent> <leader>cp :let @+=expand('%:p')<CR>:echo @+<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :vsp <C-R>=expand('%:h').'/'<cr>
" Conflicts with edit .vimrc (,ev mapping)
" nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
" nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" After whitespace, insert the current directory into a command-line path
cnoremap <expr> <C-P> getcmdline()[getcmdpos()-2] ==# ' ' ? expand('%:p:h') : "\<C-P>"


" ############# Abbreviations #############

" type ":abbreviate" to see all defined abbreviations
" and ":unabbreviate" to delete specified one
" "noreabbrev" is useful too (see help for details)

iabbrev lenght length
iabbrev defintion definition

" ############# Plugins settings #############

" ## NERDTree ##

" change cwd according to NERDTree's one
let NERDTreeChDirMode = 2
" highlighting on
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" show bookmarks table at startup
let NERDTreeShowBookmarks = 1
" and files
let NERDTreeShowFiles = 1
" LaTeX and latexmk output
let NERDTreeIgnore = ['\.aux$', '\.blg$', '\.dvi$', '\.pdf$', '\.nlo$', '\.fdb_latexmk', '\.out$']
let NERDTreeIgnore += ['\.py[co]$', '__pycache__']

" ## NERDCommenter ##

let g:NERDSpaceDelims = 1

" ## Syntastic ##

let g:syntastic_mode_map =  { 'mode': 'active',
                            \ 'passive_filetypes': ['java'] }
" ## BufferGator ##

let g:buffergator_suppress_keymaps = 1
nmap <silent> ,b<Space> :BuffergatorToggle<CR>

" ## LaTeX-Box ##

let g:LatexBox_latexmk_options = "-e '$pdflatex=q/pdflatex %O -shell-escape %S/'"
let g:LatexBox_show_warnings = 0
" let g:LatexBox_latexmk_async = 1
" let g:LatexBox_quickfix = 2
" let g:LatexBox_latexmk_preview_continuously = 1

" Might be useful
" LaTeX (rubber) macro for compiling
" nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
" nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

